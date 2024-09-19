import 'package:unipres/data/repositories/user_repository.dart';
import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/usecases/usecase.dart';

class GetPresenceHistory implements UseCase<Result<List<Presence>>, void> {
  final UserRepository _userRepository;

  GetPresenceHistory({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<Result<List<Presence>>> call(void params) async {
    var results = await _userRepository.getPresencehistories();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
