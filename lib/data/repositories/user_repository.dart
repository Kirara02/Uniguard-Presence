import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> getUser();
  Future<Result<List<Presence>>> getPresencehistories();
}
