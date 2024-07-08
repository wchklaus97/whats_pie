import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ogg_opus_player/ogg_opus_player.dart';

class AudioAttachmentWidget extends StatefulWidget {
  final File file;
  final VoidCallback refresh;

  const AudioAttachmentWidget(
      {super.key, required this.file, required this.refresh});

  @override
  State<AudioAttachmentWidget> createState() => AudioAttachmentWidgetState();
}

class AudioAttachmentWidgetState extends State<AudioAttachmentWidget> {
  late Timer _timer;
  late OggOpusPlayer _oggOpusPlayer;
  late ValueNotifier<PlayerState> _playerStateNotifi;
  late ValueNotifier<double?> _currPosNotifi;

  @override
  void initState() {
    _playerStateNotifi = ValueNotifier(PlayerState.idle);
    _currPosNotifi = ValueNotifier(null);
    _oggOpusPlayer = OggOpusPlayer(widget.file.path);
    _oggOpusPlayer.state.addListener(() {
      _playerStateNotifi.value = _oggOpusPlayer.state.value;
    });
    _playerStateNotifi.addListener(() {
      if (_playerStateNotifi.value == PlayerState.ended) {
        widget.refresh();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (!mounted) {
      _currPosNotifi.dispose();
      _oggOpusPlayer.dispose();
      _playerStateNotifi.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder<PlayerState>(
            valueListenable: _playerStateNotifi,
            builder: (context, status, child) {
              switch (status) {
                case PlayerState.playing:
                  return IconButton(
                      onPressed: () {
                        _oggOpusPlayer.pause();
                        _timer.cancel();
                      },
                      icon: const Icon(Icons.pause));
                case PlayerState.idle:
                case PlayerState.ended:
                default:
                  return IconButton(
                      onPressed: () async {
                        _oggOpusPlayer.play();
                        _timer = Timer.periodic(
                            const Duration(milliseconds: 10), (timer) {
                          if (mounted) {
                            _currPosNotifi.value =
                                _oggOpusPlayer.currentPosition;
                          }
                        });
                      },
                      icon: const Icon(Icons.play_arrow_rounded));
              }
            },
          ),
          Flexible(
              child: ValueListenableBuilder<double?>(
            valueListenable: _currPosNotifi,
            builder: (context, currPos, child) {
              if (currPos == null) return const SizedBox();
              return Text("${currPos.toStringAsFixed(2)} s");
            },
          ))
        ],
      ),
    );
  }
}
