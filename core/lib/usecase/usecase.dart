import 'package:core/core.dart';

abstract class FutureUsecaseWithoutParams<T> {
  const FutureUsecaseWithoutParams();

  ResultFuture<T> call();
}

abstract class FutureUseCaseWithParams<T, Params> {
  const FutureUseCaseWithParams();

  ResultFuture<T> call(Params params);
}
