import 'package:flutter/foundation.dart';
import 'package:flutter_amplify_auth_sampler/riverpod_based/authenticator.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_page.dart';
import 'signin_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SigninPage(),
      ),
      GoRoute(
        path: '/foo',
        builder: (_, __) => const HomePage(),
      ),
    ],
    redirect: (context, state) async {
      final user = await ref.watch(authenticatorProvider.future);
      final location = state.uri.toString();
      final isSigninLocation = location == '/';
      if (user == null) {
        return isSigninLocation ? null : '/';
      }
      if (isSigninLocation) {
        return '/foo';
      }
      return null;
    },
  );
}
