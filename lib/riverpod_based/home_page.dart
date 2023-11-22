import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_sampler/riverpod_based/authenticator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatorProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('userId: ${user?.userId ?? '---'}'),
            Text('username: ${user?.username ?? '---'}'),
            const SizedBox(height: 40),
            FilledButton(
              child: const Text('Sign out'),
              onPressed: () {
                ref.read(authenticatorProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
