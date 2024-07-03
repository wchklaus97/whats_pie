import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_bloc.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_state.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/chat_list_widget.dart';

class ChatRecordPreviewer extends StatefulWidget {
  final ChatReaderBloc chatReaderBloc;
  const ChatRecordPreviewer({super.key, required this.chatReaderBloc});

  @override
  State<ChatRecordPreviewer> createState() => _ChatRecordPreviewerState();
}

class _ChatRecordPreviewerState extends State<ChatRecordPreviewer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatReaderBloc, ChatReaderState>(
      bloc: widget.chatReaderBloc,
      builder: (context, state) {
        return state.map(
          idle: (_) => Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.green, size: 44)),
          reading: (_) => Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.green, size: 44)),
          complete: (res) => ChatListWidget(chatInfo: res.chatInfo),
          userSwitched: (res) => ChatListWidget(chatInfo: res.chatInfo),
          error: (v) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(v.errorMsg,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
