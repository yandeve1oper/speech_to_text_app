import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAudioPermissionAlert(BuildContext context) async {
  final pop = Navigator.of(context).pop;
  const title = 'Allow App to access your microphone?';
  const subtitle =
      'You will need to allow microphone access to create audio files';

  Future<void> openSettings() async {
    pop();
    await AppSettings.openAppSettings(type: AppSettingsType.settings);
  }

  if (Platform.isIOS) {
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(title),
        content: const Text(subtitle),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: pop,
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: openSettings,
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  if (Platform.isAndroid) {
    final textTheme = Theme.of(context).textTheme;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          content: const Text(subtitle, textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: pop,
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: openSettings,
              child: const Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
