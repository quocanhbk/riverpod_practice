import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_practice/entities/activity/activity.dart';

part 'main.g.dart';

// Necessary for code-generation to work
void main() {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boredActivity = ref.watch(boredActivityProvider);

    refresh() {
      ref.read(boredActivityProvider.notifier).refresh();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: switch (boredActivity) {
                AsyncData(:final value) => Text(value.activity),
                AsyncError() => const Text('Error'),
                _ => const CircularProgressIndicator(),
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: refresh,
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}

@riverpod
class BoredActivity extends _$BoredActivity {
  @override
  Future<Activity> build() async {
    final response = await http.get(Uri.https('boredapi.com', '/api/activity'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return Activity.fromJson(json);
  }

  // a method to refresh the activity
  Future<void> refresh() async {
    // final response = await http.get(Uri.https('boredapi.com', '/api/activity'));

    // final json = jsonDecode(response.body) as Map<String, dynamic>;

    // state = AsyncData(Activity.fromJson(json));
    ref.invalidateSelf();
    await future;
  }
}
