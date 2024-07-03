import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_info.freezed.dart';
part 'file_info.g.dart';

class FileConverter extends JsonConverter<File, String> {
  const FileConverter();

  @override
  File fromJson(String json) {
    return File(json);
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}

@freezed
class FileInfo with _$FileInfo {
  const factory FileInfo({
    @FileConverter() required File file,
    required String fileName,
    required String fileType,
    required DateTime lastAccessedAt,
    required DateTime lastModifiedAt,
  }) = _FileInfo;

  factory FileInfo.fromJson(Map<String, Object?> json) =>
      _$FileInfoFromJson(json);
}
