import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<User>> login({
    required String email,
    required String password,
  });

  Future<Result<void>> logout();

  Future<bool> getLoggedInUser();
}
