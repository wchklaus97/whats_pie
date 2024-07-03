// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_reader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatReaderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatReaderStateCopyWith<$Res> {
  factory $ChatReaderStateCopyWith(
          ChatReaderState value, $Res Function(ChatReaderState) then) =
      _$ChatReaderStateCopyWithImpl<$Res, ChatReaderState>;
}

/// @nodoc
class _$ChatReaderStateCopyWithImpl<$Res, $Val extends ChatReaderState>
    implements $ChatReaderStateCopyWith<$Res> {
  _$ChatReaderStateCopyWithImpl(this._value, this._then);

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
    extends _$ChatReaderStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl with DiagnosticableTreeMixin implements Idle {
  const _$IdleImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatReaderState.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatReaderState.idle'));
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
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
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
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements ChatReaderState {
  const factory Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$ReadingImplCopyWith<$Res> {
  factory _$$ReadingImplCopyWith(
          _$ReadingImpl value, $Res Function(_$ReadingImpl) then) =
      __$$ReadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadingImplCopyWithImpl<$Res>
    extends _$ChatReaderStateCopyWithImpl<$Res, _$ReadingImpl>
    implements _$$ReadingImplCopyWith<$Res> {
  __$$ReadingImplCopyWithImpl(
      _$ReadingImpl _value, $Res Function(_$ReadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReadingImpl with DiagnosticableTreeMixin implements Reading {
  const _$ReadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatReaderState.reading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatReaderState.reading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) {
    return reading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) {
    return reading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) {
    return reading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) {
    return reading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(this);
    }
    return orElse();
  }
}

abstract class Reading implements ChatReaderState {
  const factory Reading() = _$ReadingImpl;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatInfo chatInfo});

  $ChatInfoCopyWith<$Res> get chatInfo;
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$ChatReaderStateCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatInfo = null,
  }) {
    return _then(_$CompleteImpl(
      null == chatInfo
          ? _value.chatInfo
          : chatInfo // ignore: cast_nullable_to_non_nullable
              as ChatInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatInfoCopyWith<$Res> get chatInfo {
    return $ChatInfoCopyWith<$Res>(_value.chatInfo, (value) {
      return _then(_value.copyWith(chatInfo: value));
    });
  }
}

/// @nodoc

class _$CompleteImpl with DiagnosticableTreeMixin implements Complete {
  const _$CompleteImpl(this.chatInfo);

  @override
  final ChatInfo chatInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatReaderState.complete(chatInfo: $chatInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatReaderState.complete'))
      ..add(DiagnosticsProperty('chatInfo', chatInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.chatInfo, chatInfo) ||
                other.chatInfo == chatInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) {
    return complete(chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) {
    return complete?.call(chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(chatInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class Complete implements ChatReaderState {
  const factory Complete(final ChatInfo chatInfo) = _$CompleteImpl;

  ChatInfo get chatInfo;
  @JsonKey(ignore: true)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSwitchedImplCopyWith<$Res> {
  factory _$$UserSwitchedImplCopyWith(
          _$UserSwitchedImpl value, $Res Function(_$UserSwitchedImpl) then) =
      __$$UserSwitchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatInfo chatInfo});

  $ChatInfoCopyWith<$Res> get chatInfo;
}

/// @nodoc
class __$$UserSwitchedImplCopyWithImpl<$Res>
    extends _$ChatReaderStateCopyWithImpl<$Res, _$UserSwitchedImpl>
    implements _$$UserSwitchedImplCopyWith<$Res> {
  __$$UserSwitchedImplCopyWithImpl(
      _$UserSwitchedImpl _value, $Res Function(_$UserSwitchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatInfo = null,
  }) {
    return _then(_$UserSwitchedImpl(
      null == chatInfo
          ? _value.chatInfo
          : chatInfo // ignore: cast_nullable_to_non_nullable
              as ChatInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatInfoCopyWith<$Res> get chatInfo {
    return $ChatInfoCopyWith<$Res>(_value.chatInfo, (value) {
      return _then(_value.copyWith(chatInfo: value));
    });
  }
}

/// @nodoc

class _$UserSwitchedImpl with DiagnosticableTreeMixin implements UserSwitched {
  const _$UserSwitchedImpl(this.chatInfo);

  @override
  final ChatInfo chatInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatReaderState.userSwitched(chatInfo: $chatInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatReaderState.userSwitched'))
      ..add(DiagnosticsProperty('chatInfo', chatInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSwitchedImpl &&
            (identical(other.chatInfo, chatInfo) ||
                other.chatInfo == chatInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSwitchedImplCopyWith<_$UserSwitchedImpl> get copyWith =>
      __$$UserSwitchedImplCopyWithImpl<_$UserSwitchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) {
    return userSwitched(chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) {
    return userSwitched?.call(chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (userSwitched != null) {
      return userSwitched(chatInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) {
    return userSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) {
    return userSwitched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (userSwitched != null) {
      return userSwitched(this);
    }
    return orElse();
  }
}

abstract class UserSwitched implements ChatReaderState {
  const factory UserSwitched(final ChatInfo chatInfo) = _$UserSwitchedImpl;

  ChatInfo get chatInfo;
  @JsonKey(ignore: true)
  _$$UserSwitchedImplCopyWith<_$UserSwitchedImpl> get copyWith =>
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
    extends _$ChatReaderStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl with DiagnosticableTreeMixin implements Error {
  const _$ErrorImpl(this.errorMsg);

  @override
  final String errorMsg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatReaderState.error(errorMsg: $errorMsg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatReaderState.error'))
      ..add(DiagnosticsProperty('errorMsg', errorMsg));
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
    required TResult Function() reading,
    required TResult Function(ChatInfo chatInfo) complete,
    required TResult Function(ChatInfo chatInfo) userSwitched,
    required TResult Function(String errorMsg) error,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? reading,
    TResult? Function(ChatInfo chatInfo)? complete,
    TResult? Function(ChatInfo chatInfo)? userSwitched,
    TResult? Function(String errorMsg)? error,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? reading,
    TResult Function(ChatInfo chatInfo)? complete,
    TResult Function(ChatInfo chatInfo)? userSwitched,
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
    required TResult Function(Reading value) reading,
    required TResult Function(Complete value) complete,
    required TResult Function(UserSwitched value) userSwitched,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Reading value)? reading,
    TResult? Function(Complete value)? complete,
    TResult? Function(UserSwitched value)? userSwitched,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Reading value)? reading,
    TResult Function(Complete value)? complete,
    TResult Function(UserSwitched value)? userSwitched,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ChatReaderState {
  const factory Error(final String errorMsg) = _$ErrorImpl;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
