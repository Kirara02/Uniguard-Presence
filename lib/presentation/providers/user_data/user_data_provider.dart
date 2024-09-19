import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/entities/user.dart';
import 'package:unipres/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:unipres/domain/usecases/login/login_params.dart';
import 'package:unipres/domain/usecases/login/login_usecase.dart';
import 'package:unipres/presentation/providers/api/presence_histories_provider.dart';
import 'package:unipres/presentation/providers/usecases/get_user_logged_in_provider.dart';
import 'package:unipres/presentation/providers/usecases/login_provider.dart';
import 'package:unipres/presentation/providers/usecases/logout_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  FutureOr<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var userResult = await getLoggedInUser(null);

    switch (userResult) {
      case Success(value: final user):
        _getHistory();
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        _getHistory();
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    var logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  void _getHistory() {
    ref.read(presenceHistoriesProvider.notifier).getPresenceHistories();
  }
}
