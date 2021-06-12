import 'package:firebase_auth/firebase_auth.dart';

class AutoLogin {
  static bool autologin() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return true;
    }
    return false;
  }
}
