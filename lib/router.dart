import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_amplify_auth_sampler/authenticated_page.dart';
import 'package:flutter_amplify_auth_sampler/unauthenticated_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const UnauthenticatedPage(),
    ),
    GoRoute(
      path: '/foo',
      builder: (_, __) => const AuthenticatedView(
        child: AuthenticatedPage(),
      ),
    ),
  ],
);
