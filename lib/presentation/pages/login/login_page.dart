import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unipres/presentation/extension/build_context_extension.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/misc/colors.dart';
import 'package:unipres/presentation/misc/typography.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';
import 'package:unipres/presentation/providers/user_data/user_data_provider.dart';
import 'package:unipres/presentation/widgets/textfield/custom_text_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).go(Routes.MAIN);
          }
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 35 / 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              image: const DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Uniguard\nPresence App",
                  style: Typogaphy.SemiBold.copyWith(
                    fontSize: 28,
                    color: Colors.white,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 65 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Log in',
                    style: Typogaphy.SemiBold.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                CustomTextField(
                  label: "Email",
                  hintText: "youremail@email.com",
                  controller: emailController,
                ),
                CustomTextField(
                  label: "Password",
                  hintText: "*************",
                  obscureText: true,
                  controller: passwordController,
                ),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              ref
                                  .read(userDataProvider.notifier)
                                  .login(email: emailController.text, password: passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: Typogaphy.Medium.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                },
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 4),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => ref.watch(routerProvider).push(Routes.FORGOT_PASSWORD),
                    child: const Text("Forgot your password?"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
