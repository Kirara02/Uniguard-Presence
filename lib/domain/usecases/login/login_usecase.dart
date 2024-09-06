import 'package:unipres/data/repositories/auth_repository.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/usecases/login/login_params.dart';
import 'package:unipres/domain/usecases/usecase.dart';

class LoginUseCase implements UseCase<Result<void>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Result<void>> call(LoginParams params) async {
    var results = await authRepository.login(
        email: params.email, password: params.password);

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
