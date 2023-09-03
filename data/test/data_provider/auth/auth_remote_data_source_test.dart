import 'package:data/data.dart';
import 'package:data/data_provider/auth/auth_remote_data_source_impl.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {
  String _uid = 'Test uid';

  @override
  String get uid => _uid;

  set uid(String value) {
    if (_uid != value) _uid = value;
  }
}

class MockUserCredential extends Mock implements UserCredential {
  MockUserCredential([User? user]) : _user = user;
  User? _user;

  @override
  User? get user => _user;

  set user(User? value) {
    if (_user != value) _user = value;
  }
}

class MockAuthCredential extends Mock implements AuthCredential {}

void main() {
  late MockFirebaseAuth authClient;
  late FakeFirebaseFirestore cloudStoreClient;
  late AuthRemoteDataSource dataSource;
  late MockUser mockUser;
  late DocumentReference<Map<String, dynamic>> docReference;
  late MockUserCredential userCredential;
  late MockGoogleSignIn googleSignIn;
  const UserModel tUser = UserModel.empty();

  setUpAll(
    () async {
      cloudStoreClient = FakeFirebaseFirestore();
      docReference = await cloudStoreClient.collection('users').add(
            tUser.toMap(),
          );
      await cloudStoreClient.collection('users').doc(docReference.id).update(
        <Object, Object>{'uid': docReference.id},
      );
      mockUser = MockUser()..uid = docReference.id;
      userCredential = MockUserCredential(mockUser);
      authClient = MockFirebaseAuth();
      googleSignIn = MockGoogleSignIn();
      when<User?>(() => authClient.currentUser).thenReturn(mockUser);
      dataSource = AuthRemoteDataSourceImpl(
        googleSignIn: googleSignIn,
        authClient: authClient,
        cloudStoreClient: cloudStoreClient,
      );
    },
  );

  const String userPassword = 'Test password';
  const String userFullName = 'Test full name';
  const String userEmail = 'Test email';
  final FirebaseAuthException firebaseException = FirebaseAuthException(
    code: 'user-not-found',
    message: 'There is no user record corresponding to this identifier. '
        'The user may have been deleted.',
  );

  group(
    'forgotPassword',
    () {
      test(
        'should complete successfully when no [Exception] is thrown',
        () async {
          when<Future<void>>(
            () => authClient.sendPasswordResetEmail(
              email: any<String>(named: 'email'),
            ),
          ).thenAnswer((Invocation _) async => Future<void>.value());

          final Future<void> call = dataSource.forgotPassword(userEmail);

          expect(call, completes);

          verify<Future<void>>(() {
            return authClient.sendPasswordResetEmail(email: userEmail);
          }).called(1);

          verifyNoMoreInteractions(authClient);
        },
      );

      test(
        'should throw [ServerException] when [FirebaseAuthException] is thrown',
        () async {
          when<Future<void>>(
            () {
              return authClient.sendPasswordResetEmail(
                email: any(named: 'email'),
              );
            },
          ).thenThrow(firebaseException);

          final Future<void> Function(String email) call =
              dataSource.forgotPassword;

          expect(() => call(userEmail), throwsA(isA<ServerException>()));

          verify<Future<void>>(() {
            return authClient.sendPasswordResetEmail(email: userEmail);
          }).called(1);

          verifyNoMoreInteractions(authClient);
        },
      );
    },
  );

  group('signIn', () {
    test(
      'should return [LocalUserModel] when no [Exception] is thrown',
      () async {
        when<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: any<String>(named: 'email'),
              password: any<String>(named: 'password'),
            );
          },
        ).thenAnswer((Invocation _) async => userCredential);
        final UserModel result = await dataSource.signIn(
          email: userEmail,
          password: userPassword,
        );
        expect(result.uid, userCredential.user!.uid);
        expect(result.email, tUser.email);

        verify<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: userEmail,
              password: userPassword,
            );
          },
        ).called(1);

        verifyNoMoreInteractions(authClient);
      },
    );

    test(
      'should throw [ServerException] when user is null after signing in',
      () async {
        final MockUserCredential userCred = MockUserCredential();
        when<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: any<String>(named: 'email'),
              password: any<String>(named: 'password'),
            );
          },
        ).thenAnswer((Invocation _) async => userCred);

        final Future<UserModel> Function({
          required String email,
          required String password,
        }) call = dataSource.signIn;

        expect(
          () {
            return call(
              email: userEmail,
              password: userPassword,
            );
          },
          throwsA(isA<ServerException>()),
        );

        verify<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: userEmail,
              password: userPassword,
            );
          },
        ).called(1);

        verifyNoMoreInteractions(authClient);
      },
    );

    test(
      'should throw [ServerException] when [FirebaseAuthException] is thrown',
      () async {
        when<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: any<String>(named: 'email'),
              password: any<String>(named: 'password'),
            );
          },
        ).thenThrow(firebaseException);

        final Future<UserModel> Function({
          required String email,
          required String password,
        }) call = dataSource.signIn;

        expect(
          () {
            return call(
              email: userEmail,
              password: userPassword,
            );
          },
          throwsA(isA<ServerException>()),
        );

        verify<Future<UserCredential>>(
          () {
            return authClient.signInWithEmailAndPassword(
              email: userEmail,
              password: userPassword,
            );
          },
        ).called(1);

        verifyNoMoreInteractions(authClient);
      },
    );
  });

  group('signUp', () {
    test(
      'should complete successfully when no [Exception] is thrown',
      () async {
        when<Future<UserCredential>>(
          () {
            return authClient.createUserWithEmailAndPassword(
              email: any<String>(named: 'email'),
              password: any<String>(named: 'password'),
            );
          },
        ).thenAnswer((Invocation _) async => MockUserCredential());

        final Future<void> call = dataSource.signUp(
          email: userEmail,
          password: userPassword,
          fullName: userFullName,
        );

        expect(
          call,
          completes,
        );

        verify<Future<UserCredential>>(
          () {
            return authClient.createUserWithEmailAndPassword(
              email: userEmail,
              password: userPassword,
            );
          },
        ).called(1);

        test(
          'should throw [ServerException] when [FirebaseAuthException] is thrown',
          () async {
            when<Future<UserCredential>>(
              () {
                return authClient.createUserWithEmailAndPassword(
                  email: any<String>(named: 'email'),
                  password: any<String>(named: 'password'),
                );
              },
            ).thenThrow(firebaseException);

            final Future<void> Function({
              required String email,
              required String fullName,
              required String password,
            }) call = dataSource.signUp;

            expect(
              () {
                return call(
                  email: userEmail,
                  password: userPassword,
                  fullName: userFullName,
                );
              },
              throwsA(isA<ServerException>()),
            );
            verify<Future<UserCredential>>(
              () => authClient.createUserWithEmailAndPassword(
                email: userEmail,
                password: userPassword,
              ),
            ).called(1);
          },
        );
      },
    );
  });
}
