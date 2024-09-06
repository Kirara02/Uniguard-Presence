import 'package:unipres/domain/entities/result.dart';

abstract interface class AuthRepository {
  Future<Result<void>> login({
    required String email,
    required String password,
  });

  Future<Result<void>> logout();
}
