import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthData(AuthEntity authEntity);
  Future<AuthEntity?> getAuthData();
  Future<void> signInWithEmailAndPassword({String? email, String? password});
  Future<Either<Failure, dynamic>> getSignInData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheAuthData(AuthEntity authEntity) async {}

  @override
  Future<AuthEntity?> getAuthData() {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword({String? email, String? password}) {
    return Future.value();
  }

  @override
  Future<Either<Failure, dynamic>> getSignInData() {
    throw UnimplementedError();
  }
}
