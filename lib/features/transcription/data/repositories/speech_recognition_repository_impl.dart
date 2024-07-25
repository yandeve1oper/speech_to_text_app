import 'package:speech_to_text_app/core/utils/snackbar.dart';
import 'package:speech_to_text_app/features/transcription/data/data_sources/speech_recognition_data_source.dart';

import '../../domain/entities/speech_entity/speech_entity.dart';
import '../../domain/entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';
import '../../domain/repositories/speech_recognition_repository.dart';

final class SpeechRecognitionRepositoryImpl
    implements SpeechRecognitionRepository {
  final SpeechRecognitionDataSource _dataSource;

  const SpeechRecognitionRepositoryImpl({
    required SpeechRecognitionDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<SpeechRecognitionResultEntity?> recognize({
    required SpeechEntity body,
  }) async {
    try {
      final result = await _dataSource.recognize(body: body.toModel());

      if (result == null || result.alternatives.isEmpty) {
        AppSnackBar.show(
          'Transcription failed',
          type: SnackBarMessageType.error,
        );

        return null;
      }

      return result.toEntity();
    } catch (e) {
      AppSnackBar.show(
        'Transcription failed: $e',
        type: SnackBarMessageType.error,
      );

      return null;
    }
  }
}
