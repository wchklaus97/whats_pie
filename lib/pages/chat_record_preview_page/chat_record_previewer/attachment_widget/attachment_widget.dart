import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget/attachment_media_widget.dart';

class AttachmentWidget extends StatelessWidget {
  final bool isLastMsg;
  final String? dateTime;
  final bool hasTopPadding;
  final File attachmentFile;
  final bool isSelectedUser;
  final String attachmentName;
  final DirectoryInfo? directoryInfo;
  final AttachmentType attachmentType;

  const AttachmentWidget({
    super.key,
    required this.dateTime,
    required this.attachmentFile,
    required this.attachmentName,
    required this.attachmentType,
    required this.isSelectedUser,
    required this.directoryInfo,
    this.isLastMsg = false,
    this.hasTopPadding = false,
  });

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
                  child: AttachmentMediaWidget(
                    attachmentFile: attachmentFile,
                    withOverlayPreviewLayer: true,
                    attachmentType: attachmentType,
                    attachmentName: attachmentName,
                    directoryInfo: directoryInfo,
                  ),
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
