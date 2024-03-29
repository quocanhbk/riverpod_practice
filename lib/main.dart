import 'dart:developer' as devtools show log;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';
import 'package:riverpod_practice/state/auth/providers/is_logged_in_provider.dart';
import 'package:riverpod_practice/state/auth/providers/user_id_provider.dart';
import 'package:riverpod_practice/state/providers/is_loading_provider.dart';
import 'package:riverpod_practice/views/components/loading/loading_screen.dart';
import 'package:riverpod_practice/views/login/login_view.dart';

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
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, _) {
          ref.listen(isLoadingProvider, (previous, next) {
            if (next) {
              LoadingScreen.instance().show(context: context);
            } else {
              LoadingScreen.instance().hide();
            }
          });

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
