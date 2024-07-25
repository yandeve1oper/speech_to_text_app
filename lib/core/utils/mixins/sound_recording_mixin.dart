import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import 'package:speech_to_text_app/common/presentation/widgets/audio_permission_dialog.dart';

mixin SoundRecordingMixin<T extends StatefulWidget> on State<T> {
  final _recorder = AudioRecorder();
  late String _filePath;
  bool _isRecording = false;
  final RecordConfig _config = RecordConfig(
    numChannels: 1,
    sampleRate: 16000,
    encoder: Platform.isIOS ? AudioEncoder.pcm16bits : AudioEncoder.wav,
  );

  bool get isRecording => _isRecording;

  @override
  void dispose() async {
    await _recorder.dispose();

    super.dispose();
  }

  Future<void> startRecording() async {
    if (await _recorder.isRecording()) return;

    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted && mounted) {
      return showAudioPermissionAlert(context);
    }

    final tempDir = await getTemporaryDirectory();
    _filePath = '${tempDir.path}/audio_record.wav';

    await _recorder.start(_config, path: _filePath);

    setState(() => _isRecording = true);
  }

  Future<File?> stopRecording() async {
    await _recorder.stop();
    setState(() => _isRecording = false);

    return File(_filePath);
  }
}
