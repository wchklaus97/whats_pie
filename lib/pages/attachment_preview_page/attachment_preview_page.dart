import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:whats_pie/models/file_info.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/services/file_service.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget/attachment_media_widget.dart';

class AttachmentPreviewPage extends StatefulWidget {
  final File selectedFile;
  final Widget previewWidget;
  final String attachmentName;
  final DirectoryInfo? directoryInfo;
  final AttachmentType attachmentType;

  const AttachmentPreviewPage({
    super.key,
    required this.selectedFile,
    required this.previewWidget,
    required this.attachmentName,
    required this.attachmentType,
    required this.directoryInfo,
  });

  @override
  State<AttachmentPreviewPage> createState() => _AttachmentPreviewPage();
}

class _AttachmentPreviewPage extends State<AttachmentPreviewPage> {
  late ScrollController _scrollController;
  late ValueNotifier<int> _currIndexNotifi;

  @override
  void initState() {
    _currIndexNotifi = ValueNotifier(widget.directoryInfo == null
        ? 0
        : widget.directoryInfo!.getFileIndex(widget.selectedFile.path));
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _currIndexNotifi.dispose();
    super.dispose();
  }

  Widget body(AttachmentType type, Widget child) {
    return Expanded(
        child: type == AttachmentType.voice
            ? Center(child: SizedBox(width: 140, height: 70, child: child))
            : child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.attachmentName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<int>(
              valueListenable: _currIndexNotifi,
              builder: (context, currIndex, child) {
                FileInfo fileInfo = widget.directoryInfo!.files![currIndex];
                if (fileInfo.file.path == widget.selectedFile.path) {
                  return body(widget.attachmentType, widget.previewWidget);
                }
                final attachmentType =
                    getAttachmentTypeFromName(fileInfo.fileName);
                final child = AttachmentMediaWidget(
                  attachmentFile: fileInfo.file,
                  attachmentName: fileInfo.fileName,
                  attachmentType: attachmentType,
                  directoryInfo: null,
                );
                if (attachmentType == null) return const SizedBox();
                return body(attachmentType, child);
              }),
          widget.directoryInfo == null
              ? const SizedBox()
              : SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                              thumbColor: WidgetStateProperty.all<Color>(
                                  const Color.fromARGB(255, 15, 190, 91)),
                              trackColor: WidgetStateProperty.all<Color>(
                                  Colors.grey[200]!),
                              trackBorderColor:
                                  WidgetStateProperty.all<Color>(Colors.grey),
                            ),
                            child: Scrollbar(
                              interactive: true,
                              thumbVisibility: true,
                              controller: _scrollController,
                              child: ValueListenableBuilder(
                                  valueListenable: _currIndexNotifi,
                                  builder: (context, currIndex, child) {
                                    return ListView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollController,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(
                                              parent: BouncingScrollPhysics()),
                                      children: List.generate(
                                        widget.directoryInfo!.files!.length,
                                        (index) {
                                          final isSelected = index == currIndex;
                                          FileInfo fileInfo = widget
                                              .directoryInfo!.files![index];
                                          final attachmentType =
                                              getAttachmentTypeFromName(
                                                  fileInfo.fileName);
                                          final child = attachmentType ==
                                                  AttachmentType.vedio
                                              ? const Center(
                                                  child: Text("Video",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )
                                              : IgnorePointer(
                                                  ignoring: true,
                                                  child: AttachmentMediaWidget(
                                                    attachmentFile:
                                                        fileInfo.file,
                                                    attachmentName:
                                                        fileInfo.fileName,
                                                    attachmentType:
                                                        attachmentType,
                                                    directoryInfo: null,
                                                  ),
                                                );
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, right: 2, bottom: 16),
                                            child: GestureDetector(
                                              onTap: () {
                                                _currIndexNotifi.value = index;
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(12.0)),
                                                child: SizedBox(
                                                  width: 100,
                                                  child: Card(
                                                    surfaceTintColor: isSelected
                                                        ? Colors.white
                                                        : Colors.grey.shade300
                                                            .withOpacity(0.5),
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.grey.shade300
                                                            .withOpacity(0.5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      side: isSelected
                                                          ? const BorderSide(
                                                              width: 2.8,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      15,
                                                                      190,
                                                                      91))
                                                          : BorderSide.none,
                                                    ),
                                                    child: child,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
