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
