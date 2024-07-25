import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:speech_to_text_app/common/data/mappers/entity_convertable.dart';
import 'package:speech_to_text_app/features/transcription/domain/entities/speech_recognition_result_entity/speech_recognition_result_entity.dart';

import '../speech_recognition_alternative_model/speech_recognition_alternative_model.dart';

part 'speech_recognition_result_model.freezed.dart';
part 'speech_recognition_result_model.g.dart';

@Freezed(toJson: false)
class SpeechRecognitionResultModel
    with
        _$SpeechRecognitionResultModel,
        EntityConvertable<SpeechRecognitionResultModel,
            SpeechRecognitionResultEntity> {
  const SpeechRecognitionResultModel._();

  const factory SpeechRecognitionResultModel({
    @Default([]) final List<SpeechRecognitionAlternativeModel> alternatives,
    final int? channelTag,
    final String? resultEndOffset,
    final String? languageCode,
  }) = _SpeechRecognitionResultModel;

  factory SpeechRecognitionResultModel.fromJson(
    Map<String, Object?> json,
  ) =>
      _$SpeechRecognitionResultModelFromJson(json);

  @override
  SpeechRecognitionResultEntity toEntity() {
    final transcript = alternatives.elementAtOrNull(0)?.transcript;

    return SpeechRecognitionResultEntity(
      transcript: transcript,
      languageCode: languageCode,
    );
  }
}
