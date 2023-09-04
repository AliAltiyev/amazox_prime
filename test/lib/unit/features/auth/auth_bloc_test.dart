import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

class MockSignInUseCase extends Mock implements SignInUseCase {}

class MockSignInWithGoogleUseCase extends Mock
    implements SignInWithGoogleUseCase {}

class MockSignUpUseCase extends Mock implements SignUpUseCase {}

class MockAppRouter extends Mock implements AppRouter {}

class MockForgotPasswordUseCase extends Mock implements ForgotPasswordUseCase {}

void main() {
  late SignInUseCase signInUseCase;
  late SignInWithGoogleUseCase signInWithGoogleUseCase;
  late SignUpUseCase signUpUseCase;
  late ForgotPasswordUseCase forgotPasswordUseCase;
  late AppRouter appRouter;
  late AuthBloc authBloc;
  const String testPassword = 'password';
  const String testEmail = 'email';
  const String testFullName = 'fullname';

  const SignInParams signInParams = SignInParams(
    email: testEmail,
    password: testPassword,
  );

  SignUpParams signUpParams = const SignUpParams(
    email: testEmail,
    password: testPassword,
    fullName: testFullName,
  );

  setUp(
    () {
      signInUseCase = MockSignInUseCase();
      signInWithGoogleUseCase = MockSignInWithGoogleUseCase();
      signUpUseCase = MockSignUpUseCase();
      forgotPasswordUseCase = MockForgotPasswordUseCase();
      appRouter = MockAppRouter();
      authBloc = AuthBloc(
        signInWithGoogleUseCase: signInWithGoogleUseCase,
        signInUseCase: signInUseCase,
        signUpUseCase: signUpUseCase,
        forgotPasswordUseCase: forgotPasswordUseCase,
        autoRouter: appRouter,
      );
    },
  );

  group(
    'Auth bloc test',
    () {
      test(
        'initial state should be AuthInitialState ',
        () async {
          expect(
            authBloc.state,
            const AuthInitialState(),
          );
        },
      );
    },
  );

  tearDown(() => authBloc.close());
}
