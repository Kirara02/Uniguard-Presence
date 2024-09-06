import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({String? baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ??
              'https://api.example.com', // Ganti dengan base URL Anda
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

  Dio get dio => _dio;

  // Fungsi GET
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi POST
  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi PUT
  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi DELETE
  Future<Response> delete(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await _dio.delete(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi PATCH
  Future<Response> patch(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi DOWNLOAD
  Future<void> download(String url, String savePath) async {
    try {
      await _dio.download(url, savePath);
    } catch (e) {
      rethrow;
    }
  }
}
