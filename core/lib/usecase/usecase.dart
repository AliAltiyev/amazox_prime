import 'package:core/core.dart';

abstract class FutureUsecaseWithoutParams<T> {
  const FutureUsecaseWithoutParams();

  ResultFuture<T> call();
}

abstract class FutureUsecaseWithParams<T, Params> {
  const FutureUsecaseWithParams();

  ResultFuture<T> call(Params params);
}

abstract class StreamUsecaseWithParams<T, Params> {
  const StreamUsecaseWithParams();

  ResultStream<T> call(Params params);
}

abstract class StreamUsecaseWithoutParams<T> {
  const StreamUsecaseWithoutParams();

  ResultStream<T> call();
}
