import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/state/auth_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final auth = ref.read(authNotifierProvider.notifier);

    // ✅ Side-effects (NOT business logic)
    ref.listen<AsyncValue<AuthStatus>>(authNotifierProvider, (prev, next) {
      if (next is AsyncData<AuthStatus>) {
        if (next.value == AuthStatus.unauthenticated) {
          context.go('/login');
        }
      }

      if (next is AsyncError<AuthStatus>) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: authState.isLoading
                ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.logout),
            onPressed: authState.isLoading
                ? null
                : () => auth.logout(),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/products/search');
          },
          child: const Text('Search Products'),
        ),
      ),
    );
  }
}