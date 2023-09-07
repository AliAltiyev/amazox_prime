import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LogOutUseCase logOutUseCase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      logOutUseCase = LogOutUseCase(authRepository);
    },
  );
  LogOutUseCaseParams params = LogOutUseCaseParams();

  test(
    'should call the [AuthRepository.logOut()]',
    () async {
      //arrange
      when<Future<Either<Failure, void>>>(
        () => authRepository.logOut(),
      ).thenAnswer((_) async => const Right<Failure, void>(null));

      //act
      final Either<Failure, void> result = await logOutUseCase(params);

      // assert
      expect(
        result,
        equals(
          const Right<Failure, void>(null),
        ),
      );

      verify(
        () => authRepository.logOut(),
      ).called(1);

      verifyNoMoreInteractions(authRepository);
    },
  );
}
