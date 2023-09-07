import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignUpUseCase signUpUseCase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      signUpUseCase = SignUpUseCase(authRepository);
    },
  );

  const SignUpParams params = SignUpParams(
    email: 'alidroid@gmail.com',
    fullName: 'Ali',
    password: '12345',
  );

  test(
    'should call the [AuthRepository.signUp]',
    () async {
      //arrange
      when(
        () => authRepository.signUp(
          email: any(named: 'email'),
          fullName: any(named: 'fullName'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Right<Failure, void>(null));

      //act
      final Either<Failure, void> result = await signUpUseCase(params);

      // assert
      expect(
        result,
        equals(
          const Right<Failure, void>(null),
        ),
      );

      verify(
        () => authRepository.signUp(
          email: params.email,
          fullName: params.fullName,
          password: params.password,
        ),
      ).called(1);

      verifyNoMoreInteractions(authRepository);
    },
  );
}
