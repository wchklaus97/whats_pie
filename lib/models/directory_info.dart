import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:whats_pie/models/file_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'directory_info.freezed.dart';
part 'directory_info.g.dart';

@freezed
class DirectoryInfo with _$DirectoryInfo {
  const factory DirectoryInfo({
    required String name,
    required List<FileInfo>? files,
    required List<DirectoryInfo>? dirInfos,
  }) = _DirectoryInfo;

  factory DirectoryInfo.fromJson(Map<String, Object?> json) =>
      _$DirectoryInfoFromJson(json);
}

extension DirectoryInfoExtensions on DirectoryInfo {
  File? getFileWithName(String fileName) {
    if (files != null) {
      final file = files!.firstWhereOrNull((f) {
        if (f.fileType == 'txt') return false;
        return f.fileName == fileName;
      });
      if (file != null) return file.file;
      return null;
    }
    return null;
  }

  int getFileIndex(String path) {
    if (files == null) return 0;
    final index = files!.indexWhere((f) => f.file.path == path);
    if (index == -1) return 0;
    return index;
  }

  DirectoryInfo sortFiles() {
    var newFiles = files!.toList();
    newFiles.removeWhere((file) => file.fileType == 'txt');
    newFiles.sort((a, b) {
      return (a.createdAt ?? DateTime.now())
          .compareTo(b.createdAt ?? DateTime.now());
    });
    return DirectoryInfo(name: name, files: newFiles, dirInfos: dirInfos);
  }

  DirectoryInfo? updateFileInfo(
      {required String fileName, required DateTime createdAt}) {
    final fileIndex = files!.indexWhere((file) => file.fileName == fileName);
    if (fileIndex == -1) return null;

    final file = files![fileIndex];
    var newFiles = files!.toList();
    final newFileInfo = file.updateCreatedAt(createdAt);
    newFiles.removeAt(fileIndex);
    newFiles.add(newFileInfo);
    return DirectoryInfo(name: name, files: newFiles, dirInfos: dirInfos);
  }

  bool isFileNameValid(String fileName) {
    if (files != null) {
      final file = files!.firstWhereOrNull((f) {
        if (f.fileType == 'txt') return false;
        return f.fileName == fileName;
      });
      if (file != null) return true;
      return false;
    }
    return false;
  }

  File? getChatFile() {
    if (files != null) {
      final chatRecords = files!.where((v) => v.fileType == "txt");
      if (chatRecords.length == 1) {
        return chatRecords.first.file;
      }
    }
    return null;
  }

  Either<bool, String> getDirectoryStatus() {
    if (files == null && dirInfos == null) {
      return const Right(
          "This is an empty directory without any files or directories.");
    }

    if (dirInfos != null && dirInfos!.isNotEmpty) {
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
