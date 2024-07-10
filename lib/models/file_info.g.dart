// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileInfoImpl _$$FileInfoImplFromJson(Map<String, dynamic> json) =>
    _$FileInfoImpl(
      file: const FileConverter().fromJson(json['file'] as String),
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      lastAccessedAt: DateTime.parse(json['lastAccessedAt'] as String),
      lastModifiedAt: DateTime.parse(json['lastModifiedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FileInfoImplToJson(_$FileInfoImpl instance) =>
    <String, dynamic>{
      'file': const FileConverter().toJson(instance.file),
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'lastAccessedAt': instance.lastAccessedAt.toIso8601String(),
      'lastModifiedAt': instance.lastModifiedAt.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
