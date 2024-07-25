import 'package:freezed_annotation/freezed_annotation.dart';

part 'speech_recognition_result_entity.freezed.dart';
part 'speech_recognition_result_entity.g.dart';

@Freezed(fromJson: false)
class SpeechRecognitionResultEntity with _$SpeechRecognitionResultEntity {
  @JsonSerializable(createFactory: false)
  const factory SpeechRecognitionResultEntity({
    final String? transcript,
    final String? languageCode,
  }) = _SpeechRecognitionResultEntity;
}
