import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:whats_pie/models/file_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_info.freezed.dart';
part 'file_info.g.dart';

@freezed
class FileInfo with _$FileInfo {
  const factory FileInfo({
    @FileConverter() required File file,
    required String fileName,
    required String fileType,
    required DateTime lastAccessedAt,
    required DateTime lastModifiedAt,
    DateTime? createdAt,
  }) = _FileInfo;

  factory FileInfo.fromJson(Map<String, Object?> json) =>
      _$FileInfoFromJson(json);
}

extension FileInfoExtensions on FileInfo {
  FileInfo updateCreatedAt(DateTime dateTime) => FileInfo(
      file: file,
      fileName: fileName,
      fileType: fileType,
      createdAt: dateTime,
      lastAccessedAt: lastAccessedAt,
      lastModifiedAt: lastModifiedAt);
}
