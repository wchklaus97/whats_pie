import 'package:flutter/foundation.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_reader_state.freezed.dart';

@freezed
class ChatReaderState with _$ChatReaderState {
  const factory ChatReaderState.idle() = Idle;
  const factory ChatReaderState.reading() = Reading;
  const factory ChatReaderState.complete(ChatInfo chatInfo) = Complete;
  const factory ChatReaderState.userSwitched() = UserSwitched;
  const factory ChatReaderState.error(String errorMsg) = Error;
}
