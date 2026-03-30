import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/state/auth_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ProviderSubscription authSub;

  @override
  void initState() {
    super.initState();

    authSub = ref.listenManual(authNotifierProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          if (mounted) {
            context.go('/login');
          }
        },
        error: (e, _) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          }
        },
      );
    });
  }

  @override
  void dispose() {
    authSub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth.logout();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome Home"),
      ),
    );
  }
}