import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:whats_pie/pages/attachment_preview_page/attachment_preview_page.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget/audio_attachment_widget.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget/video_attachment_widget.dart';

class AttachmentMediaWidget extends StatelessWidget {
  final File attachmentFile;
  final bool withOverlayPreviewLayer;
  final String attachmentName;
  final AttachmentType? attachmentType;
  final DirectoryInfo? directoryInfo;

  const AttachmentMediaWidget({
    super.key,
    required this.attachmentFile,
    required this.attachmentType,
    required this.directoryInfo,
    this.withOverlayPreviewLayer = false,
    required this.attachmentName,
  });

  Widget overlayPreviewLayer(BuildContext context, Widget child) {
    return Stack(
      children: [
        Positioned.fill(
            child: Padding(
                padding: const EdgeInsets.only(right: 40), child: child)),
        Positioned(
          top: 2,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.fullscreen_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AttachmentPreviewPage(
                    previewWidget: child,
                    selectedFile: attachmentFile,
                    attachmentType: attachmentType!,
                    attachmentName: attachmentName,
                    directoryInfo: directoryInfo,
                  );
                },
              ));
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (attachmentType) {
      case AttachmentType.media:
        final widget = Image.file(attachmentFile);
        return SizedBox(
            width: 200,
            height: 200,
            child: withOverlayPreviewLayer
                ? overlayPreviewLayer(context, widget)
                : widget);
      case AttachmentType.doc:
        final widget = SfPdfViewer.file(attachmentFile);
        return SizedBox(
            width: 260,
            height: 280,
            child: withOverlayPreviewLayer
                ? overlayPreviewLayer(context, widget)
                : widget);
      case AttachmentType.voice:
        return StatefulBuilder(builder: (context, refresh) {
          final widget = AudioAttachmentWidget(
              key: UniqueKey(),
              file: attachmentFile,
              refresh: () => {refresh(() {})});
          return SizedBox(
              width: 140,
              height: 70,
              child: withOverlayPreviewLayer
                  ? overlayPreviewLayer(context, widget)
                  : widget);
        });
      case AttachmentType.vedio:
        return StatefulBuilder(builder: (context, refresh) {
          final widget = VideoAttachmentWidget(
              key: UniqueKey(),
              file: attachmentFile,
              refresh: () => {refresh(() {})});
          return SizedBox(
              width: 420,
              height: 300,
              child: withOverlayPreviewLayer
                  ? overlayPreviewLayer(context, widget)
                  : widget);
        });
      default:
        return const SizedBox();
    }
  }
}
