import 'package:flutter/material.dart';
import 'package:whats_pie/models/preview_info.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_bloc.dart';

class ChatRecordPreviewPage extends StatefulWidget {
  final DirectoryInfo directoryInfo;
  final FilesSearcherBloc filesSearcherBloc;

  const ChatRecordPreviewPage(
      {super.key,
      required this.directoryInfo,
      required this.filesSearcherBloc});

  @override
  State<ChatRecordPreviewPage> createState() => _ChatRecordPreviewPageState();
}

class _ChatRecordPreviewPageState extends State<ChatRecordPreviewPage> {
  late ValueNotifier<PreviewInfo?> previewInfoNotifi;

  @override
  void initState() {
    super.initState();
    previewInfoNotifi = ValueNotifier(null);
  }

  @override
  void dispose() {
    previewInfoNotifi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.directoryInfo.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => widget.filesSearcherBloc.add(FileSearcherRestart()),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          final width = boxConstraints.maxWidth;
          if (previewInfoNotifi.value != null) {
            if (!previewInfoNotifi.value!.haveSameRatio(width)) {
              previewInfoNotifi.value =
                  previewInfoNotifi.value!.copyWith(width: width);
            }
          } else {
            previewInfoNotifi.value = PreviewInfo.init(
                width: width, directoryInfo: widget.directoryInfo);
          }
          return ValueListenableBuilder<PreviewInfo?>(
            valueListenable: previewInfoNotifi,
            builder: (context, previewInfo, child) {
              if (previewInfo != null) return previewInfo.child;
              return Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: Colors.green, size: 44));
            },
          );
        },
      ),
    );
  }
}
