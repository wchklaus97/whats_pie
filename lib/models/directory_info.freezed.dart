// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectoryInfo _$DirectoryInfoFromJson(Map<String, dynamic> json) {
  return _DirectoryInfo.fromJson(json);
}

/// @nodoc
mixin _$DirectoryInfo {
  String get name => throw _privateConstructorUsedError;
  List<FileInfo>? get files => throw _privateConstructorUsedError;
  List<DirectoryInfo>? get directories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectoryInfoCopyWith<DirectoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryInfoCopyWith<$Res> {
  factory $DirectoryInfoCopyWith(
          DirectoryInfo value, $Res Function(DirectoryInfo) then) =
      _$DirectoryInfoCopyWithImpl<$Res, DirectoryInfo>;
  @useResult
  $Res call(
      {String name, List<FileInfo>? files, List<DirectoryInfo>? directories});
}

/// @nodoc
class _$DirectoryInfoCopyWithImpl<$Res, $Val extends DirectoryInfo>
    implements $DirectoryInfoCopyWith<$Res> {
  _$DirectoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? files = freezed,
    Object? directories = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileInfo>?,
      directories: freezed == directories
          ? _value.directories
          : directories // ignore: cast_nullable_to_non_nullable
              as List<DirectoryInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryInfoImplCopyWith<$Res>
    implements $DirectoryInfoCopyWith<$Res> {
  factory _$$DirectoryInfoImplCopyWith(
          _$DirectoryInfoImpl value, $Res Function(_$DirectoryInfoImpl) then) =
      __$$DirectoryInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<FileInfo>? files, List<DirectoryInfo>? directories});
}

/// @nodoc
class __$$DirectoryInfoImplCopyWithImpl<$Res>
    extends _$DirectoryInfoCopyWithImpl<$Res, _$DirectoryInfoImpl>
    implements _$$DirectoryInfoImplCopyWith<$Res> {
  __$$DirectoryInfoImplCopyWithImpl(
      _$DirectoryInfoImpl _value, $Res Function(_$DirectoryInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? files = freezed,
    Object? directories = freezed,
  }) {
    return _then(_$DirectoryInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileInfo>?,
      directories: freezed == directories
          ? _value._directories
          : directories // ignore: cast_nullable_to_non_nullable
              as List<DirectoryInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectoryInfoImpl
    with DiagnosticableTreeMixin
    implements _DirectoryInfo {
  const _$DirectoryInfoImpl(
      {required this.name,
      required final List<FileInfo>? files,
      required final List<DirectoryInfo>? directories})
      : _files = files,
        _directories = directories;

  factory _$DirectoryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryInfoImplFromJson(json);

  @override
  final String name;
  final List<FileInfo>? _files;
  @override
  List<FileInfo>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DirectoryInfo>? _directories;
  @override
  List<DirectoryInfo>? get directories {
    final value = _directories;
    if (value == null) return null;
    if (_directories is EqualUnmodifiableListView) return _directories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DirectoryInfo(name: $name, files: $files, directories: $directories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DirectoryInfo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('directories', directories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality()
                .equals(other._directories, _directories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(_directories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryInfoImplCopyWith<_$DirectoryInfoImpl> get copyWith =>
      __$$DirectoryInfoImplCopyWithImpl<_$DirectoryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryInfoImplToJson(
      this,
    );
  }
}

abstract class _DirectoryInfo implements DirectoryInfo {
  const factory _DirectoryInfo(
      {required final String name,
      required final List<FileInfo>? files,
      required final List<DirectoryInfo>? directories}) = _$DirectoryInfoImpl;

  factory _DirectoryInfo.fromJson(Map<String, dynamic> json) =
      _$DirectoryInfoImpl.fromJson;

  @override
  String get name;
  @override
  List<FileInfo>? get files;
  @override
  List<DirectoryInfo>? get directories;
  @override
  @JsonKey(ignore: true)
  _$$DirectoryInfoImplCopyWith<_$DirectoryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
