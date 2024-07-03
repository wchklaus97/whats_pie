import 'package:flutter/material.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_bloc.dart';

class ChatRecordPreviewer extends StatefulWidget {
  final ChatReaderBloc chatReaderBloc;
  const ChatRecordPreviewer({super.key, required this.chatReaderBloc});

  @override
  State<ChatRecordPreviewer> createState() => _ChatRecordPreviewerState();
}

class _ChatRecordPreviewerState extends State<ChatRecordPreviewer> {
  @override
  Widget build(BuildContext context) {
    // if (widget.chatRecordFile != null) {
    //   final res = widget.chatRecordFile!.readAsLinesSync();
    //   print("[ChatRecords]:${res.toString()}");
    // }
    return Container(color: Colors.red.withOpacity(0.2));
  }
}
