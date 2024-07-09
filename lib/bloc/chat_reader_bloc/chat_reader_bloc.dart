import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:whats_pie/common/regexp/regexp.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/services/file_service.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_state.dart';

class ChatReaderBloc extends Bloc<ChatReaderEvent, ChatReaderState> {
  final File chatFile;
  final WhatsAppRegex regex;
  static late DirectoryInfo _dirInfo;

  ChatReaderBloc(
    DirectoryInfo dirInfo, {
    required this.chatFile,
    required this.regex,
  }) : super(const ChatReaderState.idle()) {
    _dirInfo = dirInfo;
    on<ChatReaderStart>(_onStart);
    on<ChatReaderSwitch>(_onSwitch);
  }

  DirectoryInfo? getDirectoryInfo() => _dirInfo;

  String? _extractFileNameFromMsg(String value) {
    final Match? match = regex.attachmentRegExp.firstMatch(value);
    if (match != null) {
      final String extractedName = match.group(1)!.trim();
      final isFileNameValid = _dirInfo.isFileNameValid(extractedName);
      if (isFileNameValid == true) return extractedName;
      return null;
    }
    return '';
  }

  Future<ChatMsg?> _extractMsgInfoFromString(String value) async {
    Iterable<Match> matches = regex.msgRegExp.allMatches(value);
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

    if (attachmentName != null) {
      attachmentFile = _dirInfo.getFileWithName(attachmentName);
      if (attachmentFile != null) {
        isAttachmentValid = await attachmentFile.exists();
        if (isAttachmentValid) {
          final newDirectoryInfo = _dirInfo.updateFileInfo(
              fileName: attachmentName,
              createdAt: DateTime(year!, month!, day!, hour!, minute!));
          if (newDirectoryInfo != null) {
            _dirInfo = newDirectoryInfo;
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
      attachmentType:
          isAttachmentValid ? getAttachmentTypeFromName(attachmentName!) : null,
    );
  }

  Future<void> _onStart(
      ChatReaderStart event, Emitter<ChatReaderState> emit) async {
    Set<String> users = <String>{};
    List<ChatMsg> chatMsgs = [];
    emit(const ChatReaderState.reading());

    List<String> lines = chatFile.readAsLinesSync();

    for (int i = 0; i < lines.length; i++) {
      Match? match = regex.dateTimeRegExp.firstMatch(lines[i]);

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
    _dirInfo = _dirInfo.sortFiles();
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
