import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:speech_to_text_app/core/theme/styles/button/root.dart';
import 'package:speech_to_text_app/core/utils/snackbar.dart';
import 'package:speech_to_text_app/features/transcription/presentation/cubit/transcription_state.dart';

import '../cubit/transcription_cubit.dart';

class TranscriptionContent extends StatelessWidget {
  const TranscriptionContent({super.key});

  Future<void> _onPressed(String text) async {
    final data = ClipboardData(text: text);
    await Clipboard.setData(data);

    AppSnackBar.show('Copied!', type: SnackBarMessageType.info);
  }

  @override
  Widget build(BuildContext context) {
    final (isLoading, text) = context.select((TranscriptionCubit cubit) {
      final TranscriptionState(:isLoading, :result) = cubit.state;

      return (isLoading, result?.transcript ?? '');
    });

    final suffix =
        isLoading ? const CircularProgressIndicator.adaptive() : null;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Flexible(
        child: TextField(
          controller: TextEditingController(text: text),
          textAlignVertical: TextAlignVertical.top,
          expands: true,
          maxLines: null,
          readOnly: true,
          decoration: InputDecoration(
            suffix: SizedBox(height: 24.w, width: 24.w, child: suffix),
          ),
        ),
      ),
      const SizedBox(height: 6),
      if (text.isNotEmpty)
        OutlinedButton.icon(
          onPressed: () => _onPressed(text),
          style: const SmallOutlinedButtonStyle(isFullWidth: false),
          icon: const Icon(Icons.copy),
          label: const Text('Copy'),
        ),
    ]);
  }
}
