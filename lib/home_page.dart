import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Here is only displayed page if user signed in.'),
            FilledButton(
              child: const Text('Sign out'),
              onPressed: () async {
                try {
                  await Amplify.Auth.signOut();
                } on Exception catch (e) {
                  safePrint('Error signing out: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
