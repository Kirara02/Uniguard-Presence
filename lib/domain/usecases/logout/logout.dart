import 'package:unipres/data/repositories/auth_repository.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final AuthRepository _authRepository;

  Logout({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<void>> call(void params) {
    return _authRepository.logout();
  }
}
