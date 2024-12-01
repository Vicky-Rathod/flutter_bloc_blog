import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/local_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoriesImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, dynamic>> signInWithEmailAndPassword({String? email, String? password}) async {
    return await authRemoteDataSource.signInWithEmailAndPassword(email: email!, password: password!);
  }

  @override
  Future<Either<Failure, dynamic>> signUpWithEmailAndPassword(
      {String? email,
      String? password,
      String? username,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? address,
      String? city}) async {
    return await authRemoteDataSource.signUpWithEmailAndPassword(
        email: email!,
        password: password!,
        username: username ?? '',
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        phoneNumber: phoneNumber ?? '',
        address: address ?? '',
        city: city ?? '');
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    return await authRemoteDataSource.signInWithGoogle();
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithFacebook() async {
    return await authRemoteDataSource.signInWithFacebook();
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithApple() async {
    return await authRemoteDataSource.signInWithApple();
  }

  @override
  Future<Either<Failure, AuthEntity>> signInAnonymously() async {
    return await authRemoteDataSource.signInAnonymously();
  }

  @override
  Future<Either<Failure, AuthEntity>> signOut() async {
    return await authRemoteDataSource.signOut();
  }
}
