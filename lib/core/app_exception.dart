sealed class AppError implements Exception {
  const AppError(this.error);

  final Object error;

  Object get getError => error;

  @override
  String toString() => getError.toString();
}

class AppException extends AppError {
  const AppException({required Object error}) : super(error);
}
