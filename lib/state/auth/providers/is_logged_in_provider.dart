import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/state/auth/models/auth_result.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authProvider = ref.watch(authStateProvider);
  return authProvider.result == AuthResult.success;
});
