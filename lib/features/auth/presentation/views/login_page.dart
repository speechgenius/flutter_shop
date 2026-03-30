import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../state/auth_notifier.dart';
import '../state/login_form_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final auth = ref.read(authNotifierProvider.notifier);

    final form = ref.watch(loginFormProvider);
    final formNotifier = ref.read(loginFormProvider.notifier);

    ref.listen(authNotifierProvider, (prev, next) {
      next.whenOrNull(
        data: (_) => context.go('/home'),
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        },
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: formNotifier.setEmail,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              onChanged: formNotifier.setPassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),

            authState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                auth.login(form.email, form.password);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}