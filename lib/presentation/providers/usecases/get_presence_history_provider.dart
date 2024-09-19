import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/domain/usecases/get_presence_history/get_presence_history.dart';
import 'package:unipres/presentation/providers/repositories/user_repository_provider.dart';

part 'get_presence_history_provider.g.dart';

@riverpod
GetPresenceHistory getPresenceHistory(GetPresenceHistoryRef ref) =>
    GetPresenceHistory(userRepository: ref.watch(userRepositoryProvider));
