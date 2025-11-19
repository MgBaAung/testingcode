
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:testingapp/base_architecture/data/network_datasource/network_client.dart';


class HttpNetworkClient implements NetworkClient {
  final http.Client _httpClient = http.Client();

  @override
  Future<http.Response> delete(Uri uri,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _httpClient.delete(uri,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  void dispose() {
    _httpClient.close();
  }

  @override
  Future<http.Response> get(Uri uri, {Map<String, String>? headers}) {
    return _httpClient.get(uri, headers: headers);
  }

  @override
  Future<http.Response> post(Uri uri,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _httpClient.post(uri,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(Uri uri,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _httpClient.put(uri,
        headers: headers, body: body, encoding: encoding);
  }
}
