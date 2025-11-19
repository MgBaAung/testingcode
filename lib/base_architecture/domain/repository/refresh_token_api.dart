import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:testingapp/base_architecture/core/api_end_point.dart';
import 'package:testingapp/base_architecture/domain/model/login_model.dart';

class AuthClient {
  final http.Client _httpClient = http.Client();

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {}

  Future<String?> getRefreshToken() async {
    return Future.delayed(Duration(seconds: 3));
  }

  Future<bool> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return false;
    }

    final url = Uri.parse('$baseUrl/auth/refresh');
    final headers = {'Authorization': 'Bearer $refreshToken'};

    try {
      final response = await _httpClient.post(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final newTokens = LoginModel().fromMap(jsonResponse);
      }
      return false;
    } catch (e) {
      log('Error refreshing token: $e');
      return false;
    }
  }
}
