import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_sampler/riverpod_based/authenticator.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_page.dart';
import 'signin_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  // ref. https://github.com/lucavenir/go_router_riverpod/blob/e1b166c1ebac1e601d0c6eb41bfc379275def76c/example/lib/router/router.dart#L25-L39
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authenticatorProvider
          .select((user) => user.whenData((value) => value != null)),
      (_, next) {
        isAuth.value = next;
      },
    );

  return GoRouter(
    navigatorKey: routerKey,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: isAuth,
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
      final isSignedIn = isAuth.value.requireValue;
      final location = state.uri.toString();
      final isSigninLocation = location == '/';
      if (!isSignedIn) {
        return isSigninLocation ? null : '/';
      }
      if (isSigninLocation) {
        return '/foo';
      }
      return null;
    },
  );
}
