import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';

part 'transcription_state.freezed.dart';

@freezed
class TranscriptionState with _$TranscriptionState {
  const factory TranscriptionState({
    final SpeechRecognitionResultEntity? result,
    @Default(false) final bool isLoading,
    final File? audioFile,
  }) = _TranscriptionState;
}
