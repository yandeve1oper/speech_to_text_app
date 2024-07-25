import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text_app/core/utils/extensions/duration_extension.dart';

import 'package:speech_to_text_app/core/utils/mixins/sound_player_mixin.dart';
import 'package:speech_to_text_app/core/theme/app_colors.dart';

part '_play_pause_button.dart';
part '_progress_bar.dart';

class Player extends StatefulWidget {
  const Player({super.key, required this.file});

  final File file;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player>
    with SingleTickerProviderStateMixin, SoundPlayerMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Future<void> whenPlayerFinished() async {
    _controller.reverse();
    super.whenPlayerFinished();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(height: 24),
          StreamBuilder(
            stream: progressStream,
            builder: (context, snapshot) => _ProgressBar(
              duration: duration,
              position: snapshot.data ?? Duration.zero,
              seekTo: seekTo,
            ),
          ),
          _PlayPauseButton(
            animation: _controller,
            play: () => play(widget.file),
            pause: pause,
          ),
          const SizedBox(height: 12),
        ]),
      ),
    );
  }
}
