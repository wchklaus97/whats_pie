import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:whats_pie/common/regexp/regexp.dart';
import 'package:whats_pie/models/file_info.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_bloc.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/chat_record_previewer.dart';
import 'package:whats_pie/pages/chat_record_preview_page/directory_structure_previewer/directory_structure_previewer.dart';

class PreviewInfo {
  final double width;
  final Widget child;
  final DirectoryInfo dirInfo;
  final List<double> widthPcts;
  final ChatReaderBloc chatReaderBloc;

  PreviewInfo._({
    required this.width,
    required this.child,
    required this.dirInfo,
    required this.chatReaderBloc,
    required this.widthPcts,
  });

  static List<double> _calWidthPercentages(double width) {
    if (width >= 1300) {
      return [0.15, 0.85];
    } else if (width >= 1000 && width < 1300) {
      return [0.20, 0.80];
    } else if (width >= 550 && width < 1000) {
      return [0.30, 0.70];
    }
    return [0.35, 0.65];
  }

  bool haveSameRatio(double width) {
    return listEquals(widthPcts, _calWidthPercentages(width));
  }

  PreviewInfo copyWith({required double width}) {
    final newWidthPcts = _calWidthPercentages(width);
    final fileFields = _getFileFields(dirInfo.files);

    return PreviewInfo._(
      width: width,
      dirInfo: dirInfo,
      chatReaderBloc: chatReaderBloc,
      widthPcts: newWidthPcts,
      child: ResizableWidget(
        key: UniqueKey(),
        percentages: newWidthPcts,
        children: [
          DirectoryStructurePreviewer(
            nameField: fileFields.nameField,
            typeField: fileFields.typeField,
            lastAccessedAtField: fileFields.lastAccessedAtField,
            lastModifiedAtField: fileFields.lastModifiedAtField,
          ),
          ChatRecordPreviewer(chatReaderBloc: chatReaderBloc),
        ],
      ),
    );
  }

  factory PreviewInfo.init({
    required double width,
    required File chatFile,
    required DirectoryInfo dirInfo,
    required WhatsAppRegex whatsAppRegex,
  }) {
    final newWidthPcts = _calWidthPercentages(width);
    final fileFields = _getFileFields(dirInfo.files);

    final chatReaderBloc = ChatReaderBloc(
      dirInfo,
      chatFile: chatFile,
      regex: whatsAppRegex,
    );
    chatReaderBloc.add(ChatReaderStart());

    return PreviewInfo._(
      width: width,
      chatReaderBloc: chatReaderBloc,
      widthPcts: newWidthPcts,
      dirInfo: dirInfo,
      child: ResizableWidget(
        key: UniqueKey(),
        percentages: newWidthPcts,
        children: [
          DirectoryStructurePreviewer(
            nameField: fileFields.nameField,
            typeField: fileFields.typeField,
            lastAccessedAtField: fileFields.lastAccessedAtField,
            lastModifiedAtField: fileFields.lastModifiedAtField,
          ),
          ChatRecordPreviewer(chatReaderBloc: chatReaderBloc),
        ],
      ),
    );
  }

  static String formatDateTime(DateTime dateTime) =>
      DateFormat("dd/mm/yyyy hh:mm").format(dateTime);

  static _FileFields _getFileFields(List<FileInfo>? files) {
    final nameField = <String>[];
    final typeField = <String>[];
    final lastAccessedAtField = <String>[];
    final lastModifiedAtField = <String>[];

    if (files != null) {
      for (final file in files) {
        nameField.add(file.fileName);
        typeField.add(file.fileType);
        lastAccessedAtField.add(formatDateTime(file.lastAccessedAt));
        lastModifiedAtField.add(formatDateTime(file.lastModifiedAt));
      }
    }

    return _FileFields(
      nameField: nameField,
      typeField: typeField,
      lastAccessedAtField: lastAccessedAtField,
      lastModifiedAtField: lastModifiedAtField,
    );
  }
}

class _FileFields {
  final List<String> nameField;
  final List<String> typeField;
  final List<String> lastAccessedAtField;
  final List<String> lastModifiedAtField;

  _FileFields({
    required this.nameField,
    required this.typeField,
    required this.lastAccessedAtField,
    required this.lastModifiedAtField,
  });
}
