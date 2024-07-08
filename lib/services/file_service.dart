import 'dart:io';
import 'package:path/path.dart';
import 'package:either_dart/either.dart';
import 'package:file_picker/file_picker.dart';
import 'package:whats_pie/models/file_info.dart';
import 'package:whats_pie/models/directory_info.dart';

class FileService {
  Future<Either<DirectoryInfo, String>> selectFolderAndReadFiles() async {
    try {
      String? path = await FilePicker.platform.getDirectoryPath();
      if (path != null) {
        Directory directory = Directory(path);
        DirectoryInfo directoryInfo = await _buildDirectoryInfo(directory);
        return Left(directoryInfo);
      } else {
        return const Right("No directory selected");
      }
    } catch (e) {
      return Right("Error selecting folder or reading files: $e");
    }
  }

  Future<DirectoryInfo> _buildDirectoryInfo(Directory directory) async {
    List<FileSystemEntity> contents = directory.listSync();
    List<FileInfo> files = [];
    List<DirectoryInfo> directories = [];

    for (FileSystemEntity entity in contents) {
      if (entity is Directory) {
        directories.add(await _buildDirectoryInfo(entity));
      } else if (entity is File) {
        DateTime lastAccessedAt = entity.lastAccessedSync();
        DateTime lastModifiedAt = entity.lastModifiedSync();
        String filePath = entity.path;
        String fileName = basename(filePath);
        String fileType = filePath.split('.').last;
        files.add(FileInfo(
          fileName: fileName,
          fileType: fileType,
          file: entity.absolute,
          lastAccessedAt: lastAccessedAt,
          lastModifiedAt: lastModifiedAt,
        ));
      }
    }

    return DirectoryInfo(
      files: files,
      directories: directories,
      name: basename(directory.path),
    );
  }
}
