import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unipres/presentation/providers/api/presence_histories_provider.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';
import 'package:unipres/presentation/widgets/common/custom_app_bar.dart';
import 'package:unipres/presentation/widgets/common/presence_tile.dart';

class AllPresencePage extends ConsumerStatefulWidget {
  const AllPresencePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllPresencePageState();
}

class _AllPresencePageState extends ConsumerState<AllPresencePage> {
  @override
  Widget build(BuildContext context) {
    final presenceAsyncValue = ref.watch(presenceHistoriesProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "All Presence",
        onPressed: () => ref.read(routerProvider).pop(),
      ),
      body: presenceAsyncValue.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              var presenceData = data[index];
              return PresenceTile(
                presenceData: presenceData,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) {
          log('Error fetching presence histories: $e');
          return Center(child: Text('Error: $e'));
        },
      ),
    );
  }
}
