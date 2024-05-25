import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodoapp/src/models/user_model.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';
import 'package:fluttertodoapp/src/service/firebase_service/firebase_auth.dart';

enum AuthStates {
  idle,
  loading,
  signedIn,
  signedOut,
  failed,
}

var userAuthProvider = StateNotifierProvider<UserAuthProvider,AuthStates>((ref) {
  final authentication = ref.read(firebaseAuthProvider);
  return UserAuthProvider(authentication, AuthStates.idle);
});

class UserAuthProvider extends StateNotifier<AuthStates> {
  final Authentication authentication;

  UserAuthProvider(this.authentication, super.state);

  void signIn(String email, String password) async {
    state = AuthStates.loading;
    try {
      await authentication.signIn(email: email, password: password);
      state = AuthStates.signedIn;
    } on Exception catch (e) {
      print("signIn : $e");
      state = AuthStates.failed;
    }
  }



  void signOut()
  async{
    state = AuthStates.loading;
    await authentication.logout();
    state = AuthStates.signedOut;
  }
}
