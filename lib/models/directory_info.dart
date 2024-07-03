import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:whats_pie/models/file_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'directory_info.freezed.dart';
part 'directory_info.g.dart';

@freezed
class DirectoryInfo with _$DirectoryInfo {
  const factory DirectoryInfo({
    required String name,
    required List<FileInfo>? files,
    required List<DirectoryInfo>? directories,
  }) = _DirectoryInfo;

  factory DirectoryInfo.fromJson(Map<String, Object?> json) =>
      _$DirectoryInfoFromJson(json);
}

extension DirectoryInfoExtensions on DirectoryInfo {
  File? getChatRecordFile() {
    if (files != null) {
      final chatRecords = files!.where((v) => v.fileType == "txt");
      if (chatRecords.length == 1) {
        return chatRecords.first.file;
      }
    }
    return null;
  }

  Either<bool, String> getDirectoryStatus() {
    if (files == null && directories == null) {
      return const Right(
          "This is an empty directory without any files or directories.");
    }

    if (directories != null && directories!.isNotEmpty) {
      return const Right(
          "This directory is not in a valid WhatsApp format. Please check the directory structure.");
    }

    if (files == null ||
        files!.isEmpty ||
        !files!.any((file) => file.fileType == "txt")) {
      return const Right(
          "This is not a valid WhatsApp chat record format. It should contain at least one .txt file.");
    }

    return const Left(true);
  }
}
