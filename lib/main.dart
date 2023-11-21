import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_sampler/authenticator_based/authenticator_based.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred configuring Amplify: $e');
  }

  runApp(
    const ProviderScope(
      child: AuthenticatorBasedApp(),
    ),
  );
}
