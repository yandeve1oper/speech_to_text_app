import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

final class GoogleApisAuthService {
  final AccessToken accessToken;

  GoogleApisAuthService._({required this.accessToken});

  static Future<GoogleApisAuthService> init() async {
    final jsonKey = await rootBundle.loadString(
      'assets/google-credentials.json',
    );
    final credentials = ServiceAccountCredentials.fromJson(
      json.decode(jsonKey),
    );
    final authClient = await clientViaServiceAccount(
      credentials,
      ['https://www.googleapis.com/auth/cloud-platform'],
    );

    final accessToken = authClient.credentials.accessToken;

    return GoogleApisAuthService._(accessToken: accessToken);
  }
}
