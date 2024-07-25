import 'package:freezed_annotation/freezed_annotation.dart';

part 'decoding_config_model.freezed.dart';
part 'decoding_config_model.g.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Encoding { linear16, mulaw, alaw, audioEncodingUnspecified }

@freezed
class DecodingConfigModel with _$DecodingConfigModel {
  @JsonSerializable(includeIfNull: false)
  const factory DecodingConfigModel({
    @Default(1) final int audioChannelCount,
    @Default(16000) final int sampleRateHertz,
    @Default(Encoding.linear16) final Encoding encoding,
  }) = _DecodingConfigModel;

  factory DecodingConfigModel.fromJson(Map<String, Object?> json) =>
      _$DecodingConfigModelFromJson(json);
}
