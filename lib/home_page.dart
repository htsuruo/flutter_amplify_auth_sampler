import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Here is only displayed page if user signed in.'),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
