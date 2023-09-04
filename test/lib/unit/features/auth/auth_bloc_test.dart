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
  const UserEntity user = UserEntity.empty();
  const String testPassword = 'password';
  const String testEmail = 'email';
  const String testFullName = 'fullName';

  const SignInParams signInParams = SignInParams(
    email: testEmail,
    password: testPassword,
  );

  const SignUpParams signUpParams = SignUpParams(
    email: testEmail,
    password: testPassword,
    fullName: testFullName,
  );

  registerFallbackValue(signInParams);
  registerFallbackValue(signUpParams);

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

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoadingState] when  SignInEvent is added.',
    build: () {
      when<Future<Either<Failure, UserEntity>>>(
        () => signInUseCase(any<SignInParams>()),
      ).thenAnswer(
        (Invocation invocation) async {
          return const Right<Failure, UserEntity>(user);
        },
      );

      return authBloc;
    },
    act: (AuthBloc bloc) => bloc.add(
      SignInEvent(
        email: signInParams.email,
        password: signInParams.password,
      ),
    ),
    expect: () => const <AuthState>[
      AuthLoadingState(),
      SignedInState(user: user),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoadingState] when  SingUpEvent is added.',
    build: () {
      when<Future<Either<Failure, void>>>(
        () => signUpUseCase(any<SignUpParams>()),
      ).thenAnswer(
        (Invocation invocation) async {
          return const Right<Failure, void>(null);
        },
      );

      return authBloc;
    },
    act: (AuthBloc bloc) => bloc.add(
      SignUpEvent(
        name: testFullName,
        email: signInParams.email,
        password: signInParams.password,
      ),
    ),
    expect: () => const <AuthState>[
      AuthLoadingState(),
      SignedUpState(),
    ],
  );

  tearDown(() => authBloc.close());
}
