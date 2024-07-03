import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_state.dart';

class ChatReaderBloc extends Bloc<ChatReaderEvent, ChatReaderState> {
  final File? file;
  final DirectoryInfo? directoryInfo;

  final attachmentRegex = RegExp(r'\b(.*?)\s\(附件檔案\)');
  final dateTimeRegex = RegExp(r'^(\d{1,2}/\d{1,2}/\d{4}) (\d{2}:\d{2}) - ');
  final msgRegex =
      RegExp(r'^(\d{1,2})\/(\d{1,2})\/(\d{4})\s(\d{2}):(\d{2})\s-\s(.*)');

  ChatReaderBloc(this.file, this.directoryInfo)
      : super(const ChatReaderState.idle()) {
    on<ChatReaderStart>(_onStart);
    on<ChatReaderSwitch>(_onSwitch);
  }

  String? _extractFileNameFromMsg(String value) {
    final Match? match = attachmentRegex.firstMatch(value);
    if (match != null) {
      final String extractedName = match.group(1)!.trim();
      final List<String> nameParts = extractedName.split(" ");
      for (final part in nameParts) {
        if (part.contains('.webp')) {
          return part;
        }
      }
    }
    return '';
  }

  Future<ChatMsg?> _extractMsgInfoFromString(String value) async {
    Iterable<Match> matches = msgRegex.allMatches(value);
    String? day, month, year, hour, minute;
    String? sender;
    String? msg;
    String? attachmentName;
    File? attachmentFile;
    bool isAttachmentValid = false;
    for (Match x in matches) {
      day = x.group(1);
      month = x.group(2);
      year = x.group(3);
      hour = x.group(4);
      minute = x.group(5);
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

    if (directoryInfo != null && attachmentName != null) {
      attachmentFile = directoryInfo!.getFileWithName(attachmentName);
      if (attachmentFile != null) {
        isAttachmentValid = await attachmentFile.exists();
      }
    }
    return ChatMsg(
      file: file,
      sender: sender,
      attachmentName: attachmentName,
      msgs: msg != null ? [msg] : [],
      dateTime: "$day/$month/$year $hour:$minute",
      isAttachmentValid: isAttachmentValid,
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
              file: lastChatMsg.file,
              sender: lastChatMsg.sender,
              dateTime: lastChatMsg.dateTime,
              attachmentName: lastChatMsg.attachmentName,
              isAttachmentValid: lastChatMsg.isAttachmentValid,
            ),
          );
        }
      }
    }
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
    // emit(const ChatReaderState.userSwitched());
  }
}

abstract class ChatReaderEvent {}

class ChatReaderStart extends ChatReaderEvent {}

class ChatReaderSwitch extends ChatReaderEvent {}
