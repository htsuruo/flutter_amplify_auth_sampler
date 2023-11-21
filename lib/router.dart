import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_amplify_auth_sampler/home_page.dart';
import 'package:flutter_amplify_auth_sampler/signin_page.dart';
import 'package:go_router/go_router.dart';

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
