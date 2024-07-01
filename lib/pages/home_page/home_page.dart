import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_pie/services/file_service.dart';
import 'package:whats_pie/common/btn/selected_btn.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_bloc.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_state.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_preview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FilesSearcherBloc _filesSearcherBloc;

  @override
  void initState() {
    super.initState();
    _filesSearcherBloc = FilesSearcherBloc(FileService());
  }

  @override
  void dispose() {
    _filesSearcherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilesSearcherBloc, FilesSearcherState>(
        bloc: _filesSearcherBloc,
        builder: (context, state) {
          return state.map(
            idle: (_) => Center(
              child: SelectedBtn(
                name: "Select Folder",
                onPressed: () => _filesSearcherBloc.add(FileSearcherStart()),
              ),
            ),
            searching: (_) => Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.green, size: 44)),
            complete: (res) => ChatRecordPreviewPage(
                directoryInfo: res.directoryInfo,
                filesSearcherBloc: _filesSearcherBloc),
            error: (v) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(v.errorMsg,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  SelectedBtn(
                    name: "Choose Another Folder",
                    onPressed: () =>
                        _filesSearcherBloc.add(FileSearcherStart()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
