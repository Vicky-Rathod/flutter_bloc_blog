import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/app_exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
