import 'dart:io';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoAttachmentWidget extends StatefulWidget {
  final File file;
  final VoidCallback refresh;

  const VideoAttachmentWidget(
      {super.key, required this.file, required this.refresh});

  @override
  State<VideoAttachmentWidget> createState() => VideoAttachmentWidgetState();
}

class VideoAttachmentWidgetState extends State<VideoAttachmentWidget> {
  late final _player = Player();
  late final _videoController = VideoController(_player);

  @override
  void initState() {
    super.initState();
    _player.open(Media(widget.file.path), play: false);
  }

  @override
  void dispose() {
    if (!mounted) {
      _player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400, height: 300, child: Video(controller: _videoController));
  }
}
