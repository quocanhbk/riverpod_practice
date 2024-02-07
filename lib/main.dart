import 'dart:developer' as devtools show log;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';
import 'package:riverpod_practice/state/auth/providers/is_logged_in_provider.dart';
import 'package:riverpod_practice/state/auth/providers/user_id_provider.dart';

import 'firebase_options.dart';

extension Log on Object {
  void log() {
    devtools.log(toString());
  }
}

// Necessary for code-generation to work
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'riverpod_practice',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, _) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          return isLoggedIn ? const MainView() : const LoginView();
        },
      ),
    );
  }
}

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider) ?? "Unknown";
    final authStateNotifier = ref.read(authStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello $userId!"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authStateNotifier.logOut,
              child: const Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateNotifier = ref.read(authStateProvider.notifier);
    final isLoading = ref.watch(authStateProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: authStateNotifier.loginWithGoogle,
              child: const Text("Sign In with Google"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authStateNotifier.loginWithFacebook,
              child: const Text("Sign In with Facebook"),
            )
          ],
        ),
      ),
    );
  }
}
