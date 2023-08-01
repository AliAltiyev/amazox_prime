import 'package:data/data.dart';
import 'package:data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'auth_data_source.dart';
import 'user_data_source_impl.dart';

class AuthRepositoryImpl extends AuthDataSource {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  AuthRepositoryImpl({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn.standard(
              scopes: ['email'],
            ),
        _userRepository = userRepository;

  @override
  Future<auth.User?> signUp({
    required String password,
    required UserModel user,
  }) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      )
          .then((value) {
        _userRepository.createUser(
          user.copyWith(
            id: value.user!.uid,
          ),
        );
      });
    } catch (_) {}
    return null;
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then(
        (value) {
          _userRepository.createUser(
            UserModel(
              id: value.user!.uid,
              username: value.user!.displayName ?? '',
              email: value.user!.email ?? '',
            ),
          );
        },
      );
    } catch (_) {}
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  @override
  Stream<UserModel?> get user => _firebaseAuth.userChanges().cast<UserModel>();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
