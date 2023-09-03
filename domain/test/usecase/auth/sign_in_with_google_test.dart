import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignInWithGoogleUseCase signInWithGoogleUseCase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      signInWithGoogleUseCase = SignInWithGoogleUseCase(authRepository);
    },
  );

  SignInWithGoogleParams params = const SignInWithGoogleParams();

  const UserEntity user = UserEntity(
      fullName: '',
      bio: '',
      uid: '1',
      emailIsVerified: false,
      image: 'sss',
      email: 'alidroid696@gmail.com',
      username: 'ali');

  test('should call the [AuthRepository.singIn()]', () async {
    //arrange
    when(
      () => authRepository.signInWithGoogle(),
    ).thenAnswer((_) async => const Right<Failure, UserEntity>(user));

    //act
    final Either<Failure, void> result = await signInWithGoogleUseCase(params);

    // assert
    expect(
      result,
      equals(
        const Right<Failure, UserEntity>(user),
      ),
    );

    verify(
      () => authRepository.signInWithGoogle(),
    ).called(1);

    verifyNoMoreInteractions(authRepository);
  });
}
