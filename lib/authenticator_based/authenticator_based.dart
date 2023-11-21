import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

import 'router.dart';

// Initialize Amplify Auth
// ref. https://docs.amplify.aws/flutter/build-a-backend/auth/set-up-auth/#initialize-amplify-auth
class AuthenticatorBasedApp extends StatelessWidget {
  const AuthenticatorBasedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
