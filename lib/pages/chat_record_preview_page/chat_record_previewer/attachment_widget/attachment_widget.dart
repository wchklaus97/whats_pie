import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget/audio_attachment_widget.dart';

class AttachmentWidget extends StatelessWidget {
  final File attachmentFile;
  final bool isLastMsg;
  final String attachmentName;
  final String? dateTime;
  final bool hasTopPadding;
  final bool isSelectedUser;
  final AttachmentType attachmentType;
  const AttachmentWidget({
    super.key,
    required this.attachmentFile,
    required this.attachmentName,
    required this.attachmentType,
    required this.dateTime,
    required this.isSelectedUser,
    this.isLastMsg = false,
    this.hasTopPadding = false,
  });

  Widget attachmentTypeWidget() {
    switch (attachmentType) {
      case AttachmentType.media:
        return SizedBox(
            width: 180, height: 200, child: Image.file(attachmentFile));
      case AttachmentType.doc:
        return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 240, maxHeight: 280),
            child: SfPdfViewer.file(attachmentFile));
      case AttachmentType.voice:
        return StatefulBuilder(builder: (context, refresh) {
          return AudioAttachmentWidget(
            key: UniqueKey(),
            file: attachmentFile,
            refresh: () => {refresh(() {})},
          );
        });
      case AttachmentType.vedio:
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: hasTopPadding ? 42.0 : 8.0,
          bottom: 6.0 + (isLastMsg ? 20.0 : 0.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment:
                isSelectedUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: isSelectedUser
                  ? const EdgeInsets.only(right: 12.0, top: 2.0)
                  : const EdgeInsets.only(left: 12.0, top: 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: isSelectedUser
                      ? const Color.fromARGB(255, 15, 190, 91).withOpacity(0.8)
                      : Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.0),
                  child: attachmentTypeWidget(),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isSelectedUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: isSelectedUser
                  ? const EdgeInsets.only(right: 12.0, top: 2.0)
                  : const EdgeInsets.only(left: 12.0, top: 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: isSelectedUser
                      ? const Color.fromARGB(255, 15, 190, 91).withOpacity(0.8)
                      : Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.0),
                  child: Text(
                    attachmentName,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: isSelectedUser ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          dateTime != null
              ? Align(
                  alignment: isSelectedUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: isSelectedUser
                        ? const EdgeInsets.only(right: 12.0, top: 2.0)
                        : const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: isSelectedUser
                            ? const Color.fromARGB(255, 15, 190, 91)
                                .withOpacity(0.8)
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        child: Text(
                          dateTime!,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: isSelectedUser ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
