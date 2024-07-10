import 'package:whats_pie/common/regexp/regexp.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_searcher_state.freezed.dart';

@freezed
class FilesSearcherState with _$FilesSearcherState {
  const factory FilesSearcherState.idle() = Idle;
  const factory FilesSearcherState.searching() = Searching;
  const factory FilesSearcherState.complete({
    required WhatsAppRegex whatsAppRegex,
    required DirectoryInfo dirInfo,
  }) = Complete;
  const factory FilesSearcherState.error({required String errorMsg}) = Error;
}
