import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';
import 'package:riverpod_practice/state/posts/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>((ref) {
  return ref.watch(authStateProvider).userId;
});
