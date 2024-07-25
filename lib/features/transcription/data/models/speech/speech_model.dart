import 'package:freezed_annotation/freezed_annotation.dart';

import '../speech_config/speech_config_model.dart';

part 'speech_model.freezed.dart';
part 'speech_model.g.dart';

@freezed
class SpeechModel with _$SpeechModel {
  const SpeechModel._();

  @JsonSerializable(includeIfNull: false)
  const factory SpeechModel({
    final String? content,
    final SpeechConfigModel? config,
  }) = _SpeechModel;

  factory SpeechModel.fromJson(Map<String, Object?> json) =>
      _$SpeechModelFromJson(json);
}
