// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files_searcher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilesSearcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() searching,
    required TResult Function(DirectoryInfo files) complete,
    required TResult Function(String errorMsg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? searching,
    TResult? Function(DirectoryInfo files)? complete,
    TResult? Function(String errorMsg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? searching,
    TResult Function(DirectoryInfo files)? complete,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Searching value) searching,
    required TResult Function(Complete value) complete,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Searching value)? searching,
    TResult? Function(Complete value)? complete,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Searching value)? searching,
    TResult Function(Complete value)? complete,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesSearcherStateCopyWith<$Res> {
  factory $FilesSearcherStateCopyWith(
          FilesSearcherState value, $Res Function(FilesSearcherState) then) =
      _$FilesSearcherStateCopyWithImpl<$Res, FilesSearcherState>;
}

/// @nodoc
class _$FilesSearcherStateCopyWithImpl<$Res, $Val extends FilesSearcherState>
    implements $FilesSearcherStateCopyWith<$Res> {
  _$FilesSearcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$FilesSearcherStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'FilesSearcherState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() searching,
    required TResult Function(DirectoryInfo files) complete,
    required TResult Function(String errorMsg) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? searching,
    TResult? Function(DirectoryInfo files)? complete,
    TResult? Function(String errorMsg)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? searching,
    TResult Function(DirectoryInfo files)? complete,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Searching value) searching,
    required TResult Function(Complete value) complete,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Searching value)? searching,
    TResult? Function(Complete value)? complete,
    TResult? Function(Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Searching value)? searching,
    TResult Function(Complete value)? complete,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements FilesSearcherState {
  const factory Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$SearchingImplCopyWith<$Res> {
  factory _$$SearchingImplCopyWith(
          _$SearchingImpl value, $Res Function(_$SearchingImpl) then) =
      __$$SearchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchingImplCopyWithImpl<$Res>
    extends _$FilesSearcherStateCopyWithImpl<$Res, _$SearchingImpl>
    implements _$$SearchingImplCopyWith<$Res> {
  __$$SearchingImplCopyWithImpl(
      _$SearchingImpl _value, $Res Function(_$SearchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchingImpl implements Searching {
  const _$SearchingImpl();

  @override
  String toString() {
    return 'FilesSearcherState.searching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() searching,
    required TResult Function(DirectoryInfo files) complete,
    required TResult Function(String errorMsg) error,
  }) {
    return searching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? searching,
    TResult? Function(DirectoryInfo files)? complete,
    TResult? Function(String errorMsg)? error,
  }) {
    return searching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? searching,
    TResult Function(DirectoryInfo files)? complete,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Searching value) searching,
    required TResult Function(Complete value) complete,
    required TResult Function(Error value) error,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Searching value)? searching,
    TResult? Function(Complete value)? complete,
    TResult? Function(Error value)? error,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Searching value)? searching,
    TResult Function(Complete value)? complete,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class Searching implements FilesSearcherState {
  const factory Searching() = _$SearchingImpl;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DirectoryInfo files});

  $DirectoryInfoCopyWith<$Res> get files;
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$FilesSearcherStateCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_$CompleteImpl(
      null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as DirectoryInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DirectoryInfoCopyWith<$Res> get files {
    return $DirectoryInfoCopyWith<$Res>(_value.files, (value) {
      return _then(_value.copyWith(files: value));
    });
  }
}

/// @nodoc

class _$CompleteImpl implements Complete {
  const _$CompleteImpl(this.files);

  @override
  final DirectoryInfo files;

  @override
  String toString() {
    return 'FilesSearcherState.complete(files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.files, files) || other.files == files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, files);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() searching,
    required TResult Function(DirectoryInfo files) complete,
    required TResult Function(String errorMsg) error,
  }) {
    return complete(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? searching,
    TResult? Function(DirectoryInfo files)? complete,
    TResult? Function(String errorMsg)? error,
  }) {
    return complete?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? searching,
    TResult Function(DirectoryInfo files)? complete,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Searching value) searching,
    required TResult Function(Complete value) complete,
    required TResult Function(Error value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Searching value)? searching,
    TResult? Function(Complete value)? complete,
    TResult? Function(Error value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Searching value)? searching,
    TResult Function(Complete value)? complete,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class Complete implements FilesSearcherState {
  const factory Complete(final DirectoryInfo files) = _$CompleteImpl;

  DirectoryInfo get files;
  @JsonKey(ignore: true)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FilesSearcherStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.errorMsg);

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'FilesSearcherState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() searching,
    required TResult Function(DirectoryInfo files) complete,
    required TResult Function(String errorMsg) error,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? searching,
    TResult? Function(DirectoryInfo files)? complete,
    TResult? Function(String errorMsg)? error,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? searching,
    TResult Function(DirectoryInfo files)? complete,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Searching value) searching,
    required TResult Function(Complete value) complete,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Searching value)? searching,
    TResult? Function(Complete value)? complete,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Searching value)? searching,
    TResult Function(Complete value)? complete,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements FilesSearcherState {
  const factory Error(final String errorMsg) = _$ErrorImpl;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
