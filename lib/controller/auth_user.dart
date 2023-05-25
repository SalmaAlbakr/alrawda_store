import 'package:firebase_auth/firebase_auth.dart';

Future<bool> checkUserExists(String email) async {
  try {
    final signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    return signInMethods.isNotEmpty;
  } catch (e) {
    print("Error checking user existence: $e");
    return false;
  }
}
