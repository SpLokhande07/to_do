import 'package:todo_app/import_helper.dart';

var authPod = ChangeNotifierProvider((ref) => AuthPodProvider(ref));

class AuthPodProvider extends ChangeNotifier {
  Ref ref;
  UserCredential? userCredential;
  bool loading = false;
  AuthPodProvider(this.ref);

  Future<UserCredential?> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      showToastMsg(msg: "Login successful");
    } catch (e) {
      showToastMsg(msg: "Something went wrong");
    }
    return userCredential;
  }

  bool loadingValue() {
    loading = !loading;
    return loading;
  }
}
