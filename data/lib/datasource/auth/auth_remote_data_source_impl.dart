import 'package:data/data.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required FirebaseAuth authClient,
    required FirebaseFirestore cloudStoreClient,
    required GoogleSignIn googleSignIn,
  })  : _authClient = authClient,
        _cloudStoreClient = cloudStoreClient,
        _googleSignIn = googleSignIn;
  final FirebaseAuth _authClient;
  final FirebaseFirestore _cloudStoreClient;
  final GoogleSignIn _googleSignIn;

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _authClient.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message: e.message ?? StringConstants.error,
        statusCode: e.code,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: StringConstants.code_500,
      );
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      final UserCredential userCred =
          await _authClient.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCred.user?.updateDisplayName(fullName);
      await _setUserData(
        user: _authClient.currentUser!,
        fallbackEmail: email,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message: e.message ?? StringConstants.error,
        statusCode: e.code,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: StringConstants.code_500,
      );
    }
  }

  Future<DocumentSnapshot<DataMap>> _getUserData(String uid) async {
    return _cloudStoreClient
        .collection(
          FirebaseEnum.users.name,
        )
        .doc(uid)
        .get();
  }

  Future<void> _setUserData({
    String? fallbackEmail,
    required User user,
  }) async {
    await _cloudStoreClient
        .collection(
          FirebaseEnum.users.name,
        )
        .doc(user.uid)
        .set(
          UserModel(
            emailIsVerified: user.emailVerified,
            username: user.displayName ?? '',
            bio: '',
            uid: user.uid,
            email: user.email ?? fallbackEmail ?? '',
            fullName: user.displayName ?? '',
            image: user.photoURL ?? '',
          ).toMap(),
        );
  }

  @override
  Future<void> logOut() async {
    try {
      await _authClient.signOut();
    } catch (e) {
      throw ServerFailure(
        message: e.toString(),
        statusCode: e,
      );
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _authClient.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        throw const ServerException(
          message: StringConstants.tryLater,
          statusCode: StringConstants.error,
        );
      }

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _getUserData(user.uid);
      if (userData.exists) {
        return UserModel.fromJson(userData.data()!);
      }
      await _setUserData(user: user);

      userData = await _getUserData(user.uid);
      return UserModel.fromJson(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message: e.message ?? StringConstants.error,
        statusCode: e.code,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: StringConstants.code_500,
      );
    }
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result =
          await _authClient.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = result.user;
      if (user == null) {
        throw const ServerException(
          message: StringConstants.tryLater,
          statusCode: StringConstants.error,
        );
      }

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _getUserData(user.uid);
      if (userData.exists) {
        return UserModel.fromJson(userData.data()!);
      }
      await _setUserData(
        user: user,
        fallbackEmail: email,
      );

      userData = await _getUserData(user.uid);
      return UserModel.fromJson(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message: e.message ?? StringConstants.error,
        statusCode: e.code,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: StringConstants.code_500,
      );
    }
  }
}
