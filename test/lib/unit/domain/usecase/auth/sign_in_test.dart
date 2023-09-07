import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignInUseCase signInUseCase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      signInUseCase = SignInUseCase(authRepository);
    },
  );
  SignInParams params = const SignInParams(
    email: 'alidroid@mgial.com',
    password: '123455',
  );

  const UserEntity user = UserEntity(
    fullName: '',
    bio: '',
    uid: '1',
    emailIsVerified: false,
    image: 'sss',
    email: 'alidroid696@gmail.com',
    username: 'ali',
  );

  test('should call the [AuthRepository.singIn()]', () async {
    //arrange
    when(
      () => authRepository.signIn(
        email: params.email,
        password: params.password,
      ),
    ).thenAnswer((_) async => const Right<Failure, UserEntity>(user));

    //act
    final Either<Failure, void> result = await signInUseCase(params);

    // assert
    expect(
      result,
      equals(
        const Right<Failure, UserEntity>(user),
      ),
    );

    verify(
      () => authRepository.signIn(
        email: params.email,
        password: params.password,
      ),
    ).called(1);

    verifyNoMoreInteractions(authRepository);
  });
}
