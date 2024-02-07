import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/state/auth/providers/auth_state_provider.dart';

final isLoadingProvider =
    Provider<bool>((ref) => ref.watch(authStateProvider).isLoading);
