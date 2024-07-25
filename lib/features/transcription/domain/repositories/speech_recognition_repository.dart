import '../entities/speech_entity/speech_entity.dart';
import '../entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';

abstract interface class SpeechRecognitionRepository {
  Future<SpeechRecognitionResultEntity?> recognize({
    required SpeechEntity body,
  });
}
