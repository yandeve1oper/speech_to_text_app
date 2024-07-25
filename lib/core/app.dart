import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:speech_to_text_app/core/dependencies.dart';
import 'package:speech_to_text_app/features/transcription/presentation/cubit/transcription_cubit.dart';
import 'package:speech_to_text_app/features/transcription/presentation/pages/transcription_page.dart';

import 'theme/theme.dart';
import 'utils/snackbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, widget) => MaterialApp(
        theme: theme,
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: BlocProvider(
          create: (context) => TranscriptionCubit(
            recognizeAudioUseCase: injector(),
          ),
          child: const TranscriptionPage(),
        ),
      ),
    );
  }
}
