import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_sampler/riverpod_based/authenticator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: FilledButton(
              child: const Text('Sign in'),
              onPressed: () {
                ref.read(authenticatorProvider.notifier).signIn();
              },
            ),
          ),
        ),
      ),
    );
  }
}
