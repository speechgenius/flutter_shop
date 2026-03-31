import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers.dart';

part 'auth_notifier.g.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthStatus> build() async {
    // Initial state (you can later check token here)
    return AuthStatus.unauthenticated;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.login(email, password);

      return AuthStatus.authenticated;
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.logout();

      return AuthStatus.unauthenticated;
    });
  }
}