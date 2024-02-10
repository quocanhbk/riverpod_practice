import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';
import 'package:riverpod_practice/views/constants/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_practice/views/login/login_view_signup_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateNotifier = ref.read(authStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 128),
                Text(
                  Strings.appname,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  Strings.logIntoYourAccount,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: authStateNotifier.loginWithGoogle,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                  ),
                  label: const Text(Strings.loginWithGoogle),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: authStateNotifier.loginWithFacebook,
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                  ),
                  label: const Text(Strings.loginWithFacebook),
                ),
                const SizedBox(height: 32),
                const Divider(),
                const LoginViewSignupLink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
