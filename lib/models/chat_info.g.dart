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
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$ChatMsgImplToJson(_$ChatMsgImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'sender': instance.sender,
      'msg': instance.msg,
    };
