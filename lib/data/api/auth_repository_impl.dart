import 'package:unipres/data/repositories/auth_repository.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/presentation/misc/api_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/login',
        {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final results = List<Map<String, dynamic>>.from(response.data);
        // Handle successful login
        return Result.success(results);
      } else {
        // Handle error response
        return Result.failed('Login failed: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle network or other errors
      return Result.failed('Login error: $e');
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      final response = await _apiClient.post('/logout', {});

      if (response.statusCode == 200) {
        // Handle successful logout
        return Result.success(null);
      } else {
        // Handle error response
        return Result.failed('Logout failed: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle network or other errors
      return Result.failed('Logout error: $e');
    }
  }
}
