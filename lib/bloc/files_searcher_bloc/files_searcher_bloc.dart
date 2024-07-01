import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:whats_pie/models/directory_info.dart';
import 'package:whats_pie/services/file_service.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_state.dart';

class FilesSearcherBloc extends Bloc<FilesSearcherEvent, FilesSearcherState> {
  final FileService _fileService;

  FilesSearcherBloc(this._fileService)
      : super(const FilesSearcherState.idle()) {
    on<FileSearcherStart>(_onStart);
    on<FileSearcherRestart>(_onRestart);
  }

  Future<void> _onStart(
      FileSearcherStart event, Emitter<FilesSearcherState> emit) async {
    emit(const FilesSearcherState.searching());
    late Either<DirectoryInfo, String> files;
    await Future.delayed(const Duration(milliseconds: 500), () async {
      files = await _fileService.selectFolderAndReadFiles();
    });
    if (files.isLeft) {
      emit(FilesSearcherState.complete(files.left));
    } else {
      emit(FilesSearcherState.error(files.right));
    }
  }

  Future<void> _onRestart(
      FileSearcherRestart event, Emitter<FilesSearcherState> emit) async {
    emit(const FilesSearcherState.idle());
  }
}

abstract class FilesSearcherEvent {}

class FileSearcherStart extends FilesSearcherEvent {}

class FileSearcherRestart extends FilesSearcherEvent {}
