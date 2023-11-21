import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'signin_page.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const SigninPage(),
    ),
    GoRoute(
      path: '/foo',
      builder: (_, __) => const AuthenticatedView(
        child: HomePage(),
      ),
    ),
  ],
);
