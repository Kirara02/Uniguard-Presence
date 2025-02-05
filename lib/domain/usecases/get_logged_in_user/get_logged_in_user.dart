import 'package:unipres/data/repositories/auth_repository.dart';
import 'package:unipres/data/repositories/user_repository.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/entities/user.dart';
import 'package:unipres/domain/usecases/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  GetLoggedInUser({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void params) async {
    bool loggedIn = await _authRepository.getLoggedInUser();
    if (loggedIn) {
      var userResult = await _userRepository.getUser();

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('No user logged in');
    }
  }
}
