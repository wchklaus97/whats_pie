import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_state.dart';

class ChatReaderBloc extends Bloc<ChatReaderEvent, ChatReaderState> {
  final File? file;

  ChatReaderBloc(this.file) : super(const ChatReaderState.idle()) {
    on<ChatReaderStart>(_onStart);
    on<ChatReaderSwitch>(_onSwitch);
  }

  ChatMsg splitChatString(String value) {
    String? sender;
    String? dateTime;
    String? msg;

    int fistDashIndex = value.indexOf('-');
    if (fistDashIndex != -1) {
      // Extract the date and time part
      dateTime = value.substring(0, fistDashIndex).trim();

      // Extract the sender and message part
      String senderAndMessagePart = value.substring(fistDashIndex + 1).trim();

      // Extract the sender and message
      int colonIndex = senderAndMessagePart.indexOf(':');
      if (colonIndex != -1) {
        sender = senderAndMessagePart.substring(0, colonIndex).trim();
        msg = senderAndMessagePart.substring(colonIndex + 1).trim();
      } else {
        msg = senderAndMessagePart;
      }
    }
    return ChatMsg(dateTime: dateTime, sender: sender, msg: msg);
  }

  Future<void> _onStart(
      ChatReaderStart event, Emitter<ChatReaderState> emit) async {
    Set<String> users = <String>{};
    List<ChatMsg> chatMsgs = [];
    emit(const ChatReaderState.reading());

    if (file != null) {
      List<String> chatRecords = await file!.readAsLines();

      for (var record in chatRecords) {
        final chatMsg = splitChatString(record);
        if (chatMsg.sender != null) {
          users.add(chatMsg.sender!);
        }
        chatMsgs.add(chatMsg);
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
