// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) {
  return _FileInfo.fromJson(json);
}

/// @nodoc
mixin _$FileInfo {
  String get fileName => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;
  DateTime get lastAccessedAt => throw _privateConstructorUsedError;
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileInfoCopyWith<FileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileInfoCopyWith<$Res> {
  factory $FileInfoCopyWith(FileInfo value, $Res Function(FileInfo) then) =
      _$FileInfoCopyWithImpl<$Res, FileInfo>;
  @useResult
  $Res call(
      {String fileName,
      String fileType,
      DateTime lastAccessedAt,
      DateTime lastModifiedAt});
}

/// @nodoc
class _$FileInfoCopyWithImpl<$Res, $Val extends FileInfo>
    implements $FileInfoCopyWith<$Res> {
  _$FileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileType = null,
    Object? lastAccessedAt = null,
    Object? lastModifiedAt = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedAt: null == lastAccessedAt
          ? _value.lastAccessedAt
          : lastAccessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileInfoImplCopyWith<$Res>
    implements $FileInfoCopyWith<$Res> {
  factory _$$FileInfoImplCopyWith(
          _$FileInfoImpl value, $Res Function(_$FileInfoImpl) then) =
      __$$FileInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fileName,
      String fileType,
      DateTime lastAccessedAt,
      DateTime lastModifiedAt});
}

/// @nodoc
class __$$FileInfoImplCopyWithImpl<$Res>
    extends _$FileInfoCopyWithImpl<$Res, _$FileInfoImpl>
    implements _$$FileInfoImplCopyWith<$Res> {
  __$$FileInfoImplCopyWithImpl(
      _$FileInfoImpl _value, $Res Function(_$FileInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileType = null,
    Object? lastAccessedAt = null,
    Object? lastModifiedAt = null,
  }) {
    return _then(_$FileInfoImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedAt: null == lastAccessedAt
          ? _value.lastAccessedAt
          : lastAccessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileInfoImpl with DiagnosticableTreeMixin implements _FileInfo {
  const _$FileInfoImpl(
      {required this.fileName,
      required this.fileType,
      required this.lastAccessedAt,
      required this.lastModifiedAt});

  factory _$FileInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileInfoImplFromJson(json);

  @override
  final String fileName;
  @override
  final String fileType;
  @override
  final DateTime lastAccessedAt;
  @override
  final DateTime lastModifiedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FileInfo(fileName: $fileName, fileType: $fileType, lastAccessedAt: $lastAccessedAt, lastModifiedAt: $lastModifiedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FileInfo'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileType', fileType))
      ..add(DiagnosticsProperty('lastAccessedAt', lastAccessedAt))
      ..add(DiagnosticsProperty('lastModifiedAt', lastModifiedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileInfoImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.lastAccessedAt, lastAccessedAt) ||
                other.lastAccessedAt == lastAccessedAt) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fileName, fileType, lastAccessedAt, lastModifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileInfoImplCopyWith<_$FileInfoImpl> get copyWith =>
      __$$FileInfoImplCopyWithImpl<_$FileInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileInfoImplToJson(
      this,
    );
  }
}

abstract class _FileInfo implements FileInfo {
  const factory _FileInfo(
      {required final String fileName,
      required final String fileType,
      required final DateTime lastAccessedAt,
      required final DateTime lastModifiedAt}) = _$FileInfoImpl;

  factory _FileInfo.fromJson(Map<String, dynamic> json) =
      _$FileInfoImpl.fromJson;

  @override
  String get fileName;
  @override
  String get fileType;
  @override
  DateTime get lastAccessedAt;
  @override
  DateTime get lastModifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$FileInfoImplCopyWith<_$FileInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
