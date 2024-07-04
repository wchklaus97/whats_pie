import 'dart:io';
import 'package:whats_pie/models/file_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_info.freezed.dart';
part 'chat_info.g.dart';

@freezed
class ChatInfo with _$ChatInfo {
  const factory ChatInfo({
    required List<ChatMsg> chatMsg,
    Set<String>? users,
    String? selectedUser,
  }) = _ChatInfo;

  factory ChatInfo.fromJson(Map<String, Object?> json) =>
      _$ChatInfoFromJson(json);
}

@freezed
class ChatMsg with _$ChatMsg {
  const factory ChatMsg({
    required String? dateTime,
    required String? sender,
    required List<String>? msgs,
    required String? attachmentName,
    required bool? isAttachmentValid,
    @FileConverter() required File? file,
  }) = _ChatMsg;

  factory ChatMsg.fromJson(Map<String, Object?> json) =>
      _$ChatMsgFromJson(json);
}
