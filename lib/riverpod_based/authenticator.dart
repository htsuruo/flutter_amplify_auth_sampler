import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authenticator.g.dart';

@riverpod
class Authenticator extends _$Authenticator {
  @override
  FutureOr<AuthUser?> build() async {
    try {
      final isSignedIn = (await _auth.fetchAuthSession()).isSignedIn;
      return isSignedIn ? _auth.getCurrentUser() : null;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      safePrint('Error getting current user: $e');
    }
    return null;
  }

  final _auth = Amplify.Auth;

  Future<void> signIn() async {
    try {
      // フォームを作るのが面倒だったので適宜変更してください
      await _auth.signIn(username: 'foo', password: 'bar');
      ref.invalidateSelf();
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // なにかエラーを表示する
      safePrint('Error getting current user: $e');
    }
  }

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      await _auth.signOut();
      return null;
    });
  }
}
