// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectoryInfoImpl _$$DirectoryInfoImplFromJson(Map<String, dynamic> json) =>
    _$DirectoryInfoImpl(
      name: json['name'] as String,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      directories: (json['directories'] as List<dynamic>?)
          ?.map((e) => DirectoryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DirectoryInfoImplToJson(_$DirectoryInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'files': instance.files,
      'directories': instance.directories,
    };
