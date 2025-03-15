import '../../../entity/user.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmail(
      String email, String password, String username, String phone);
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<UserModel> signUpWithEmail(
      String email, String password, String username, String phone) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user == null) throw Exception("User creation failed");

      await user.updateDisplayName(username);

      final userModel = UserModel(
          uid: user.uid,
          username: username,
          email: email,
          phone: phone,
          password: password);
      await firestore.collection('users').doc(user.uid).set(userModel.toJson());

      return userModel;
    } catch (e) {
      throw Exception("Firebase Error: $e");
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw Exception("Google Sign-In failed");

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    return UserModel(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName ?? "",
      email: userCredential.user!.email!,
      phone: userCredential.user!.phoneNumber ?? "",
      password: "",
    );
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status != LoginStatus.success)
      throw Exception("Facebook login failed");

    final AuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    return UserModel(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName ?? "",
      email: userCredential.user!.email!,
      phone: userCredential.user!.phoneNumber ?? "",
      password: "",
    );
  }
}
