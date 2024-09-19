import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/domain/usecases/login/login_usecase.dart';
import 'package:unipres/presentation/providers/repositories/auth_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(authRepository: ref.watch(authRepositoryProvider));
