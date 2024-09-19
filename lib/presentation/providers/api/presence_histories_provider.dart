import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/usecases/get_presence_history/get_presence_history.dart';
import 'package:unipres/presentation/providers/usecases/get_presence_history_provider.dart';

part 'presence_histories_provider.g.dart';

@Riverpod(keepAlive: true)
class PresenceHistories extends _$PresenceHistories {
  @override
  FutureOr<List<Presence>> build() => const [];

  Future<void> getPresenceHistories() async {
    state = const AsyncLoading();

    GetPresenceHistory getPresenceHistory = ref.read(getPresenceHistoryProvider);

    var result = await getPresenceHistory(null);

    switch (result) {
      case Success(value: final histories):
        state = AsyncData(histories);

      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
