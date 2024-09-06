import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/misc/typography.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        ref.watch(routerProvider).go(Routes.LOGIN);
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
