import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:speech_to_text_app/core/theme/app_colors.dart';
import 'package:speech_to_text_app/core/utils/mixins/sound_recording_mixin.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({super.key, required this.onStopRecording});

  final void Function(File? file) onStopRecording;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with SingleTickerProviderStateMixin, SoundRecordingMixin {
  late final AnimationController _controller;

  IconData get _icon => _controller.isAnimating ? Icons.stop : Icons.mic;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _stopRecordingAndRecognize() async {
    final file = await stopRecording();

    if (!mounted) return;

    widget.onStopRecording(file);
  }

  Future<void> _onPressed() async {
    if (_controller.isAnimating) {
      _controller.reset();
      _stopRecordingAndRecognize();
      return setState(() {});
    }

    await startRecording();
    setState(() {});

    if (isRecording) {
      _controller.repeat(reverse: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedBuilder(
        animation: _controller,
        child: IconButton.filled(
          padding: const EdgeInsets.all(24),
          style: IconButton.styleFrom(backgroundColor: Colors.transparent),
          onPressed: _onPressed,
          icon: Icon(_icon, color: AppColors.white, size: 46.sp),
        ),
        builder: (context, widget) => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.blue.withOpacity(0.4),
                spreadRadius: _controller.value * 10,
              ),
              BoxShadow(
                color: AppColors.blue.withOpacity(0.2),
                spreadRadius: _controller.value * 16,
              ),
            ],
            shape: BoxShape.circle,
            gradient: const RadialGradient(radius: 1.8, colors: [
              AppColors.blue,
              AppColors.purple,
            ]),
          ),
          child: widget,
        ),
      ),
    ]);
  }
}
