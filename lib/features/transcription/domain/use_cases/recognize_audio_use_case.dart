import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:speech_to_text_app/core/utils/snackbar.dart';
import 'package:speech_to_text_app/features/transcription/domain/repositories/speech_recognition_repository.dart';

import '../../data/models/speech_config/speech_config_model.dart';
import '../entities/speech_entity/speech_entity.dart';
import '../entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';

final class RecognizeAudioUseCase {
  final SpeechRecognitionRepository _repository;

  const RecognizeAudioUseCase({
    required SpeechRecognitionRepository repository,
  }) : _repository = repository;

  Future<SpeechRecognitionResultEntity?> call(File file) async {
    SpeechEntity? data;

    try {
      data = await compute((file) async {
        final bytes = await file.readAsBytes();

        return SpeechEntity(
          content: base64Encode(bytes),
          languageCodes: ['en-US'],
          model: SpeechRecognitionModel.latestLong,
        );
      }, file);
    } catch (e) {
      AppSnackBar.show(
        'Processing file failed: $e',
        type: SnackBarMessageType.error,
      );

      return null;
    }

    if (data == null) {
      return null;
    }

    return await _repository.recognize(body: data);
  }
}
