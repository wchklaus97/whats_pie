// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatInfoImpl _$$ChatInfoImplFromJson(Map<String, dynamic> json) =>
    _$ChatInfoImpl(
      chatMsg: (json['chatMsg'] as List<dynamic>)
          .map((e) => ChatMsg.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>?)?.map((e) => e as String).toSet(),
      selectedUser: json['selectedUser'] as String?,
    );

Map<String, dynamic> _$$ChatInfoImplToJson(_$ChatInfoImpl instance) =>
    <String, dynamic>{
      'chatMsg': instance.chatMsg,
      'users': instance.users?.toList(),
      'selectedUser': instance.selectedUser,
    };

_$ChatMsgImpl _$$ChatMsgImplFromJson(Map<String, dynamic> json) =>
    _$ChatMsgImpl(
      dateTime: json['dateTime'] as String?,
      sender: json['sender'] as String?,
      msgs: (json['msgs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attachmentType:
          $enumDecodeNullable(_$AttachmentTypeEnumMap, json['attachmentType']),
      attachmentName: json['attachmentName'] as String?,
      isAttachmentValid: json['isAttachmentValid'] as bool?,
      attachmentFile: _$JsonConverterFromJson<String, File>(
          json['attachmentFile'], const FileConverter().fromJson),
    );

Map<String, dynamic> _$$ChatMsgImplToJson(_$ChatMsgImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'sender': instance.sender,
      'msgs': instance.msgs,
      'attachmentType': _$AttachmentTypeEnumMap[instance.attachmentType],
      'attachmentName': instance.attachmentName,
      'isAttachmentValid': instance.isAttachmentValid,
      'attachmentFile': _$JsonConverterToJson<String, File>(
          instance.attachmentFile, const FileConverter().toJson),
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.media: 'media',
  AttachmentType.doc: 'doc',
  AttachmentType.vedio: 'vedio',
  AttachmentType.voice: 'voice',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
