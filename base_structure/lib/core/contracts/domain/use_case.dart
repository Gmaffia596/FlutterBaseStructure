// ignore_for_file: one_member_abstracts

abstract class UseCase<T, Params extends Object?> {
  T call(Params params);
}

abstract class AsyncUseCase<T, Params extends Object?> {
  Future<T> call(Params params);
}
