import 'package:code_pioneers/main.dart';

class AuthService {
  Future<bool> register(String mail, String password) async {
    try {
      await cloud.auth.signUp(password: password, email: mail);
      return true;
    } catch (e) {
      return false;
    }
  }


  login(String email, String password) async {
    try {
      await cloud.auth.signInWithPassword(password: password, email: email);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await cloud.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isLoggedIn() => cloud.auth.currentSession != null;

  //access token,refresh token=>session
}