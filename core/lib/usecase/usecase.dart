import 'package:core/core.dart';

abstract class FutureUsecaseWithoutParams<T> {
  const FutureUsecaseWithoutParams();

  ResultFuture<T> call();
}

abstract class FutureUsecaseWithParams<T, Params> {
  const FutureUsecaseWithParams();

  ResultFuture<T> call(Params params);
}
