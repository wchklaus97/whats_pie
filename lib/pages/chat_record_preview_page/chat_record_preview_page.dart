import 'package:flutter/material.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_bloc.dart';

class ChatRecordPreviewPage extends StatefulWidget {
  final FilesSearcherBloc filesSearcherBloc;

  const ChatRecordPreviewPage({super.key, required this.filesSearcherBloc});

  @override
  State<ChatRecordPreviewPage> createState() => _ChatRecordPreviewPageState();
}

class _ChatRecordPreviewPageState extends State<ChatRecordPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("ChatRecordPreviewPage",
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
