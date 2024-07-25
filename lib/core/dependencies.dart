import 'package:get_it/get_it.dart';

import 'package:speech_to_text_app/features/transcription/data/data_sources/speech_recognition_data_source.dart';
import 'package:speech_to_text_app/features/transcription/data/data_sources/speech_recognition_data_source_impl.dart';
import 'package:speech_to_text_app/features/transcription/data/repositories/speech_recognition_repository_impl.dart';
import 'package:speech_to_text_app/features/transcription/domain/repositories/speech_recognition_repository.dart';
import 'package:speech_to_text_app/features/transcription/domain/use_cases/recognize_audio_use_case.dart';

import 'services/googleapis_auth_service.dart';
import 'utils/constants.dart';

final injector = GetIt.instance;

class Dependencies {
  static Future<void> init() async {
    _initServices();
    _initDataSources();
    _initRepositories();
    _initUseCases();
    await injector.allReady();
  }

  static void _initServices() =>
      injector.registerSingletonAsync(GoogleApisAuthService.init);

  static void _initDataSources() =>
      injector.registerLazySingleton<SpeechRecognitionDataSource>(
        () => SpeechRecognitionDataSourceImpl(
          accessToken: injector<GoogleApisAuthService>().accessToken,
          baseUrl: speechRecognitionServiceUrl,
        ),
      );

  static void _initRepositories() =>
      injector.registerLazySingleton<SpeechRecognitionRepository>(
        () => SpeechRecognitionRepositoryImpl(dataSource: injector()),
      );

  static void _initUseCases() => injector.registerLazySingleton(
      () => RecognizeAudioUseCase(repository: injector()));
}
