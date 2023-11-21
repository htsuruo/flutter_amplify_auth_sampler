import 'package:flutter/material.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Here is only displayed page if user signed in.'),
            FilledButton(
              onPressed: () {},
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
