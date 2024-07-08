import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_state.dart';

class ChatReaderBloc extends Bloc<ChatReaderEvent, ChatReaderState> {
  final File? file;
  static DirectoryInfo? _directoryInfo;

  final attachmentRegex = RegExp(r'\b(.*?)\s\(附件檔案\)');
  final dateTimeRegex = RegExp(r'^(\d{1,2}/\d{1,2}/\d{4}) (\d{2}:\d{2}) - ');
  final msgRegex =
      RegExp(r'^(\d{1,2})\/(\d{1,2})\/(\d{4})\s(\d{2}):(\d{2})\s-\s(.*)');

  ChatReaderBloc(this.file, DirectoryInfo directoryInfo)
      : super(const ChatReaderState.idle()) {
    _directoryInfo = directoryInfo;
    on<ChatReaderStart>(_onStart);
    on<ChatReaderSwitch>(_onSwitch);
  }

  String? _extractFileNameFromMsg(String value) {
    final Match? match = attachmentRegex.firstMatch(value);
    if (match != null) {
      final String extractedName = match.group(1)!.trim();
      final isFileNameValid = _directoryInfo!.isFileNameValid(extractedName);
      if (isFileNameValid == true) return extractedName;
      return null;
    }
    return '';
  }

  AttachmentType? _getAttachmentTypeFromName(String value) {
    final type = value.split('.').last;
    switch (type) {
      case "webp":
      case "png":
      case "jpeg":
      case "jpg":
      case "gif":
        return AttachmentType.media;
      case "pdf":
        return AttachmentType.doc;
      case "opus":
        return AttachmentType.voice;
      case "mp4":
        return AttachmentType.vedio;
      default:
        return null;
    }
  }

  Future<ChatMsg?> _extractMsgInfoFromString(String value) async {
    Iterable<Match> matches = msgRegex.allMatches(value);
    int? day, month, year, hour, minute;
    String? sender;
    String? msg;
    String? attachmentName;
    File? attachmentFile;
    bool isAttachmentValid = false;
    for (Match x in matches) {
      day = int.tryParse(x.group(1)!);
      month = int.parse(x.group(2)!);
      year = int.parse(x.group(3)!);
      hour = int.parse(x.group(4)!);
      minute = int.parse(x.group(5)!);
      msg = x.group(6);
      if (msg != null && msg.contains(":")) {
        int colonIndex = msg.indexOf(":");
        sender = msg.substring(0, colonIndex);
        msg = msg.substring(colonIndex + 1).trim();
        attachmentName = _extractFileNameFromMsg(msg);
      } else {
        if (msg != null) {
          attachmentName = _extractFileNameFromMsg(msg);
        }
      }
    }

    if (_directoryInfo != null && attachmentName != null) {
      attachmentFile = _directoryInfo!.getFileWithName(attachmentName);
      if (attachmentFile != null) {
        isAttachmentValid = await attachmentFile.exists();
        if (isAttachmentValid) {
          final newDirectoryInfo = _directoryInfo!.updateFileInfo(
              fileName: attachmentName,
              createdAt: DateTime(year!, month!, day!, hour!, minute!));
          if (newDirectoryInfo != null) {
            _directoryInfo = newDirectoryInfo;
          }
        }
      }
    }
    return ChatMsg(
      sender: sender,
      attachmentName: attachmentName,
      msgs: msg != null ? [msg] : [],
      dateTime: "$day/$month/$year $hour:$minute",
      isAttachmentValid: isAttachmentValid,
      attachmentFile: isAttachmentValid ? attachmentFile : null,
      attachmentType: isAttachmentValid
          ? _getAttachmentTypeFromName(attachmentName!)
          : null,
    );
  }

  Future<void> _onStart(
      ChatReaderStart event, Emitter<ChatReaderState> emit) async {
    Set<String> users = <String>{};
    List<ChatMsg> chatMsgs = [];
    emit(const ChatReaderState.reading());

    if (file != null) {
      List<String> lines = file!.readAsLinesSync();

      for (int i = 0; i < lines.length; i++) {
        Match? match = dateTimeRegex.firstMatch(lines[i]);

        if (match != null) {
          ChatMsg? chatMsg = await _extractMsgInfoFromString(lines[i]);
          if (chatMsg != null) {
            chatMsg.sender != null ? users.add(chatMsg.sender!) : null;
            chatMsgs.add(chatMsg);
          }
        } else {
          final lastChatMsg = chatMsgs.last;
          chatMsgs.removeLast();
          List<String> msgs =
              lastChatMsg.msgs != null ? lastChatMsg.msgs!.toList() : [];
          msgs.add(lines[i]);
          chatMsgs.add(
            ChatMsg(
              msgs: msgs,
              attachmentFile: lastChatMsg.attachmentFile,
              attachmentType: lastChatMsg.attachmentType,
              sender: lastChatMsg.sender,
              dateTime: lastChatMsg.dateTime,
              attachmentName: lastChatMsg.attachmentName,
              isAttachmentValid: lastChatMsg.isAttachmentValid,
            ),
          );
        }
      }
    }
    _directoryInfo = _directoryInfo!.sortFiles();
    if (chatMsgs.isNotEmpty) {
      emit(
        ChatReaderState.complete(
          ChatInfo(
            chatMsg: chatMsgs,
            users: users,
            selectedUser: users.isNotEmpty ? users.first : null,
          ),
        ),
      );
    } else {
      emit(const ChatReaderState.error("Without Chat Histories"));
    }
  }

  Future<void> _onSwitch(
      ChatReaderSwitch event, Emitter<ChatReaderState> emit) async {
    emit(const ChatReaderState.reading());
    emit(ChatReaderState.userSwitched(
      ChatInfo(
        chatMsg: event.chatInfo.chatMsg,
        selectedUser: event.user,
        users: event.chatInfo.users,
      ),
    ));
  }
}

abstract class ChatReaderEvent {}

class ChatReaderStart extends ChatReaderEvent {}

class ChatReaderSwitch extends ChatReaderEvent {
  final String user;
  final ChatInfo chatInfo;

  ChatReaderSwitch({required this.user, required this.chatInfo});
}
