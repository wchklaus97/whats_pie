import 'package:whats_pie/models/directory_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_searcher_state.freezed.dart';

@freezed
class FilesSearcherState with _$FilesSearcherState {
  const factory FilesSearcherState.idle() = Idle;
  const factory FilesSearcherState.searching() = Searching;
  const factory FilesSearcherState.complete(DirectoryInfo files) = Complete;
  const factory FilesSearcherState.error(String errorMsg) = Error;
}
