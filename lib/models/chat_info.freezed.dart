// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatInfo _$ChatInfoFromJson(Map<String, dynamic> json) {
  return _ChatInfo.fromJson(json);
}

/// @nodoc
mixin _$ChatInfo {
  List<ChatMsg> get chatMsg => throw _privateConstructorUsedError;
  Set<String>? get users => throw _privateConstructorUsedError;
  String? get selectedUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatInfoCopyWith<ChatInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatInfoCopyWith<$Res> {
  factory $ChatInfoCopyWith(ChatInfo value, $Res Function(ChatInfo) then) =
      _$ChatInfoCopyWithImpl<$Res, ChatInfo>;
  @useResult
  $Res call({List<ChatMsg> chatMsg, Set<String>? users, String? selectedUser});
}

/// @nodoc
class _$ChatInfoCopyWithImpl<$Res, $Val extends ChatInfo>
    implements $ChatInfoCopyWith<$Res> {
  _$ChatInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatMsg = null,
    Object? users = freezed,
    Object? selectedUser = freezed,
  }) {
    return _then(_value.copyWith(
      chatMsg: null == chatMsg
          ? _value.chatMsg
          : chatMsg // ignore: cast_nullable_to_non_nullable
              as List<ChatMsg>,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatInfoImplCopyWith<$Res>
    implements $ChatInfoCopyWith<$Res> {
  factory _$$ChatInfoImplCopyWith(
          _$ChatInfoImpl value, $Res Function(_$ChatInfoImpl) then) =
      __$$ChatInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatMsg> chatMsg, Set<String>? users, String? selectedUser});
}

/// @nodoc
class __$$ChatInfoImplCopyWithImpl<$Res>
    extends _$ChatInfoCopyWithImpl<$Res, _$ChatInfoImpl>
    implements _$$ChatInfoImplCopyWith<$Res> {
  __$$ChatInfoImplCopyWithImpl(
      _$ChatInfoImpl _value, $Res Function(_$ChatInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatMsg = null,
    Object? users = freezed,
    Object? selectedUser = freezed,
  }) {
    return _then(_$ChatInfoImpl(
      chatMsg: null == chatMsg
          ? _value._chatMsg
          : chatMsg // ignore: cast_nullable_to_non_nullable
              as List<ChatMsg>,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatInfoImpl implements _ChatInfo {
  const _$ChatInfoImpl(
      {required final List<ChatMsg> chatMsg,
      final Set<String>? users,
      this.selectedUser})
      : _chatMsg = chatMsg,
        _users = users;

  factory _$ChatInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatInfoImplFromJson(json);

  final List<ChatMsg> _chatMsg;
  @override
  List<ChatMsg> get chatMsg {
    if (_chatMsg is EqualUnmodifiableListView) return _chatMsg;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMsg);
  }

  final Set<String>? _users;
  @override
  Set<String>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableSetView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  final String? selectedUser;

  @override
  String toString() {
    return 'ChatInfo(chatMsg: $chatMsg, users: $users, selectedUser: $selectedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatInfoImpl &&
            const DeepCollectionEquality().equals(other._chatMsg, _chatMsg) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chatMsg),
      const DeepCollectionEquality().hash(_users),
      selectedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatInfoImplCopyWith<_$ChatInfoImpl> get copyWith =>
      __$$ChatInfoImplCopyWithImpl<_$ChatInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatInfoImplToJson(
      this,
    );
  }
}

abstract class _ChatInfo implements ChatInfo {
  const factory _ChatInfo(
      {required final List<ChatMsg> chatMsg,
      final Set<String>? users,
      final String? selectedUser}) = _$ChatInfoImpl;

  factory _ChatInfo.fromJson(Map<String, dynamic> json) =
      _$ChatInfoImpl.fromJson;

  @override
  List<ChatMsg> get chatMsg;
  @override
  Set<String>? get users;
  @override
  String? get selectedUser;
  @override
  @JsonKey(ignore: true)
  _$$ChatInfoImplCopyWith<_$ChatInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMsg _$ChatMsgFromJson(Map<String, dynamic> json) {
  return _ChatMsg.fromJson(json);
}

/// @nodoc
mixin _$ChatMsg {
  String? get dateTime => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;
  List<String>? get msgs => throw _privateConstructorUsedError;
  AttachmentType? get attachmentType => throw _privateConstructorUsedError;
  String? get attachmentName => throw _privateConstructorUsedError;
  bool? get isAttachmentValid => throw _privateConstructorUsedError;
  @FileConverter()
  File? get attachmentFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMsgCopyWith<ChatMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMsgCopyWith<$Res> {
  factory $ChatMsgCopyWith(ChatMsg value, $Res Function(ChatMsg) then) =
      _$ChatMsgCopyWithImpl<$Res, ChatMsg>;
  @useResult
  $Res call(
      {String? dateTime,
      String? sender,
      List<String>? msgs,
      AttachmentType? attachmentType,
      String? attachmentName,
      bool? isAttachmentValid,
      @FileConverter() File? attachmentFile});
}

/// @nodoc
class _$ChatMsgCopyWithImpl<$Res, $Val extends ChatMsg>
    implements $ChatMsgCopyWith<$Res> {
  _$ChatMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? sender = freezed,
    Object? msgs = freezed,
    Object? attachmentType = freezed,
    Object? attachmentName = freezed,
    Object? isAttachmentValid = freezed,
    Object? attachmentFile = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      msgs: freezed == msgs
          ? _value.msgs
          : msgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      attachmentType: freezed == attachmentType
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as AttachmentType?,
      attachmentName: freezed == attachmentName
          ? _value.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAttachmentValid: freezed == isAttachmentValid
          ? _value.isAttachmentValid
          : isAttachmentValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachmentFile: freezed == attachmentFile
          ? _value.attachmentFile
          : attachmentFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMsgImplCopyWith<$Res> implements $ChatMsgCopyWith<$Res> {
  factory _$$ChatMsgImplCopyWith(
          _$ChatMsgImpl value, $Res Function(_$ChatMsgImpl) then) =
      __$$ChatMsgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dateTime,
      String? sender,
      List<String>? msgs,
      AttachmentType? attachmentType,
      String? attachmentName,
      bool? isAttachmentValid,
      @FileConverter() File? attachmentFile});
}

/// @nodoc
class __$$ChatMsgImplCopyWithImpl<$Res>
    extends _$ChatMsgCopyWithImpl<$Res, _$ChatMsgImpl>
    implements _$$ChatMsgImplCopyWith<$Res> {
  __$$ChatMsgImplCopyWithImpl(
      _$ChatMsgImpl _value, $Res Function(_$ChatMsgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? sender = freezed,
    Object? msgs = freezed,
    Object? attachmentType = freezed,
    Object? attachmentName = freezed,
    Object? isAttachmentValid = freezed,
    Object? attachmentFile = freezed,
  }) {
    return _then(_$ChatMsgImpl(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      msgs: freezed == msgs
          ? _value._msgs
          : msgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      attachmentType: freezed == attachmentType
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as AttachmentType?,
      attachmentName: freezed == attachmentName
          ? _value.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAttachmentValid: freezed == isAttachmentValid
          ? _value.isAttachmentValid
          : isAttachmentValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachmentFile: freezed == attachmentFile
          ? _value.attachmentFile
          : attachmentFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMsgImpl implements _ChatMsg {
  const _$ChatMsgImpl(
      {required this.dateTime,
      required this.sender,
      required final List<String>? msgs,
      required this.attachmentType,
      required this.attachmentName,
      required this.isAttachmentValid,
      @FileConverter() required this.attachmentFile})
      : _msgs = msgs;

  factory _$ChatMsgImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMsgImplFromJson(json);

  @override
  final String? dateTime;
  @override
  final String? sender;
  final List<String>? _msgs;
  @override
  List<String>? get msgs {
    final value = _msgs;
    if (value == null) return null;
    if (_msgs is EqualUnmodifiableListView) return _msgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AttachmentType? attachmentType;
  @override
  final String? attachmentName;
  @override
  final bool? isAttachmentValid;
  @override
  @FileConverter()
  final File? attachmentFile;

  @override
  String toString() {
    return 'ChatMsg(dateTime: $dateTime, sender: $sender, msgs: $msgs, attachmentType: $attachmentType, attachmentName: $attachmentName, isAttachmentValid: $isAttachmentValid, attachmentFile: $attachmentFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMsgImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            const DeepCollectionEquality().equals(other._msgs, _msgs) &&
            (identical(other.attachmentType, attachmentType) ||
                other.attachmentType == attachmentType) &&
            (identical(other.attachmentName, attachmentName) ||
                other.attachmentName == attachmentName) &&
            (identical(other.isAttachmentValid, isAttachmentValid) ||
                other.isAttachmentValid == isAttachmentValid) &&
            (identical(other.attachmentFile, attachmentFile) ||
                other.attachmentFile == attachmentFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateTime,
      sender,
      const DeepCollectionEquality().hash(_msgs),
      attachmentType,
      attachmentName,
      isAttachmentValid,
      attachmentFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMsgImplCopyWith<_$ChatMsgImpl> get copyWith =>
      __$$ChatMsgImplCopyWithImpl<_$ChatMsgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMsgImplToJson(
      this,
    );
  }
}

abstract class _ChatMsg implements ChatMsg {
  const factory _ChatMsg(
      {required final String? dateTime,
      required final String? sender,
      required final List<String>? msgs,
      required final AttachmentType? attachmentType,
      required final String? attachmentName,
      required final bool? isAttachmentValid,
      @FileConverter() required final File? attachmentFile}) = _$ChatMsgImpl;

  factory _ChatMsg.fromJson(Map<String, dynamic> json) = _$ChatMsgImpl.fromJson;

  @override
  String? get dateTime;
  @override
  String? get sender;
  @override
  List<String>? get msgs;
  @override
  AttachmentType? get attachmentType;
  @override
  String? get attachmentName;
  @override
  bool? get isAttachmentValid;
  @override
  @FileConverter()
  File? get attachmentFile;
  @override
  @JsonKey(ignore: true)
  _$$ChatMsgImplCopyWith<_$ChatMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
