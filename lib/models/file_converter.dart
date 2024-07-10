import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

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
