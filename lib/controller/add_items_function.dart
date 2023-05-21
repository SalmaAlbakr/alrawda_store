import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
late User signedInUser;

void getCurrentUser() {
  try {
    final user = _auth.currentUser;
    if (user != null) {
      signedInUser = user;
    }
  } catch (e) {
    print(e);
  }
}

