import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

mixin SoundPlayerMixin<T extends StatefulWidget> on State<T> {
  final _player = AudioPlayer();
  Duration? _duration;
  File? _file;
  StreamSubscription<PlayerState>? _sub;

  Duration get duration => _duration ?? Duration.zero;

  Stream<Duration?> get progressStream => _player.positionStream;

  @override
  void initState() {
    _setupPlayer();

    super.initState();
  }

  @override
  void dispose() async {
    await _sub?.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> whenPlayerFinished() async {
    await _player.seek(Duration.zero);
    await _player.stop();
  }

  Future<void> _setupPlayer() async {
    _sub = _player.playerStateStream.listen((event) {
      final PlayerState(:processingState) = event;

      if (processingState == ProcessingState.completed) {
        whenPlayerFinished();
      }
    });
  }

  Future<void> seekTo(double value) async {
    final duration = _duration ?? const Duration();
    final seekToValue = (value * duration.inMilliseconds).toInt();
    final seekToPosition = Duration(milliseconds: seekToValue);

    _player.seek(seekToPosition);
  }

  Future<void> play(File file) async {
    if (_file != file || _player.audioSource == null) {
      _file = file;
      _duration = await _player.setFilePath(file.path);
    }

    await _player.play();
  }

  Future<void> pause() => _player.pause();
}
