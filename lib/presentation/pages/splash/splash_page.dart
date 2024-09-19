import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unipres/presentation/extension/build_context_extension.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/misc/typography.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';
import 'package:unipres/presentation/providers/user_data/user_data_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).go(Routes.MAIN);
          } else {
            ref.read(routerProvider).go(Routes.LOGIN);
          }
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Uniguard",
            style: Typogaphy.SemiBold.copyWith(
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
