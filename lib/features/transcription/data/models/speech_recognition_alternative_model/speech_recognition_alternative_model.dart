import 'package:freezed_annotation/freezed_annotation.dart';

part 'speech_recognition_alternative_model.freezed.dart';
part 'speech_recognition_alternative_model.g.dart';

@Freezed(toJson: false)
class SpeechRecognitionAlternativeModel
    with _$SpeechRecognitionAlternativeModel {
  const factory SpeechRecognitionAlternativeModel({
    final String? transcript,
    final double? confidence,
  }) = _SpeechRecognitionAlternativeModel;

  factory SpeechRecognitionAlternativeModel.fromJson(
    Map<String, Object?> json,
  ) =>
      _$SpeechRecognitionAlternativeModelFromJson(json);
}
