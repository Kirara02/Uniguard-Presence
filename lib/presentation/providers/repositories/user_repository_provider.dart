import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/data/dummies/dummy_user_repository.dart';
import 'package:unipres/data/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => DummyUserRepository();
