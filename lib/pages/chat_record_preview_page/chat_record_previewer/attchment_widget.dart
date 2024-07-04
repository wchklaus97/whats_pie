import 'dart:io';
import 'package:flutter/material.dart';

class AttachmentWidget extends StatelessWidget {
  final File attachmentFile;
  final bool isLastMsg;
  final String attachmentName;
  final String? dateTime;
  final bool hasTopPadding;
  final bool isSelectedUser;
  const AttachmentWidget({
    super.key,
    required this.attachmentFile,
    required this.attachmentName,
    required this.dateTime,
    required this.isSelectedUser,
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
                  child: Image.file(attachmentFile, width: 180, height: 200),
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
