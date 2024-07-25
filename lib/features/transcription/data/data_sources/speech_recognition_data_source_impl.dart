import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

import 'speech_recognition_data_source.dart';
import '../models/speech/speech_model.dart';
import '../models/speech_recognition_result_model/speech_recognition_result_model.dart';

final class SpeechRecognitionDataSourceImpl
    implements SpeechRecognitionDataSource {
  late final Map<String, String>? _headers;
  late final Uri _url;

  SpeechRecognitionDataSourceImpl({
    required AccessToken accessToken,
    required String baseUrl,
  }) {
    final AccessToken(:data) = accessToken;

    _headers = {
      'Authorization': 'Bearer $data',
      'Content-Type': 'application/json'
    };

    _url = Uri.parse('$baseUrl/locations/global/recognizers/_:recognize');
  }

  @override
  Future<SpeechRecognitionResultModel?> recognize({
    required SpeechModel body,
  }) async {
    final res = await http.post(
      _url,
      headers: _headers,
      body: json.encode(body.toJson()),
    );

    if (res.statusCode == 200) {
      final responseBody = jsonDecode(res.body);
      final List results = responseBody?['results'] ?? [];
      final Map<String, Object?> json = results.elementAtOrNull(0) ?? {};

      return SpeechRecognitionResultModel.fromJson(json);
    }

    throw Exception(res.reasonPhrase);
  }
}
