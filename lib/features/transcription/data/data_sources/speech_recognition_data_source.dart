import '../models/speech/speech_model.dart';
import '../models/speech_recognition_result_model/speech_recognition_result_model.dart';

abstract interface class SpeechRecognitionDataSource {
  Future<SpeechRecognitionResultModel?> recognize({required SpeechModel body});
}
