import 'package:freezed_annotation/freezed_annotation.dart';

import '../decoding_config/decoding_config_model.dart';

part 'speech_config_model.freezed.dart';
part 'speech_config_model.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum SpeechRecognitionModel { latestShort, latestLong, basic }

@freezed
class SpeechConfigModel with _$SpeechConfigModel {
  @JsonSerializable(includeIfNull: false)
  const factory SpeechConfigModel({
    final List<String>? languageCodes,
    final SpeechRecognitionModel? model,
    @Default(DecodingConfigModel())
    final DecodingConfigModel explicitDecodingConfig,
  }) = _SpeechConfigModel;

  factory SpeechConfigModel.fromJson(Map<String, Object?> json) =>
      _$SpeechConfigModelFromJson(json);
}
