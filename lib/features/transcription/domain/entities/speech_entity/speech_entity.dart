import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:speech_to_text_app/common/data/mappers/model_convertable.dart';
import 'package:speech_to_text_app/features/transcription/data/models/speech/speech_model.dart';

import '../../../data/models/speech_config/speech_config_model.dart';

part 'speech_entity.freezed.dart';
part 'speech_entity.g.dart';

@Freezed(fromJson: false)
class SpeechEntity
    with _$SpeechEntity, ModelConvertable<SpeechModel, SpeechEntity> {
  const SpeechEntity._();

  @JsonSerializable(createFactory: false)
  const factory SpeechEntity({
    final String? content,
    final List<String>? languageCodes,
    final SpeechRecognitionModel? model,
  }) = _SpeechEntity;

  @override
  SpeechModel toModel() => SpeechModel(
        config: SpeechConfigModel(
          languageCodes: languageCodes,
          model: model,
        ),
        content: content,
      );
}
