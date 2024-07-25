import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:speech_to_text_app/common/presentation/widgets/player/player.dart';
import 'package:speech_to_text_app/core/utils/extensions/theme_exstension.dart';
import 'package:speech_to_text_app/common/presentation/widgets/record_button.dart';

import '../cubit/transcription_cubit.dart';
import '../cubit/transcription_state.dart';
import '../widgets/transcription_content.dart';

class TranscriptionPage extends StatefulWidget {
  const TranscriptionPage({super.key});

  @override
  State<TranscriptionPage> createState() => _TranscriptionPageState();
}

class _TranscriptionPageState extends State<TranscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Transcription'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.pageHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<TranscriptionCubit, TranscriptionState>(
                builder: (context, state) {
                  final TranscriptionState(:audioFile, :isLoading) = state;

                  if (audioFile == null) {
                    return const SizedBox.shrink();
                  }

                  return Column(children: [
                    const Flexible(child: TranscriptionContent()),
                    const SizedBox(height: 18),
                    IgnorePointer(
                      ignoring: isLoading,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: isLoading ? 0 : 1,
                        child: Player(file: audioFile),
                      ),
                    )
                  ]);
                },
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: RecordButton(
                onStopRecording: (file) => context.read<TranscriptionCubit>()
                  ..setAudioFile(file)
                  ..recognize(),
              ),
            ),
            const SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
