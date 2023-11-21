import 'package:flutter/material.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated Page'),
      ),
      body: const Center(
        child: Text('You are unauthenticated.'),
      ),
    );
  }
}
