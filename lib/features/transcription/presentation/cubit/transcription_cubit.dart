import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';
import '../../domain/use_cases/recognize_audio_use_case.dart';

import 'transcription_state.dart';

class TranscriptionCubit extends Cubit<TranscriptionState> {
  final RecognizeAudioUseCase _recognizeAudioUseCase;

  TranscriptionCubit({
    required RecognizeAudioUseCase recognizeAudioUseCase,
  })  : _recognizeAudioUseCase = recognizeAudioUseCase,
        super(const TranscriptionState());

  void _setResult(SpeechRecognitionResultEntity? value) {
    emit(state.copyWith(result: value));
  }

  void _setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void setAudioFile(File? value) {
    emit(state.copyWith(audioFile: value));
  }

  Future<void> recognize() async {
    if (state.audioFile == null) return;

    _setLoading(true);

    final result = await _recognizeAudioUseCase.call(state.audioFile!);

    _setResult(result);
    _setLoading(false);
  }
}
