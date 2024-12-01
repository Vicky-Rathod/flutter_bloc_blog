import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> signInWithEmailAndPassword({required String email, required String password});

  Future<Either<Failure, dynamic>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String address,
      required String city});

  Future<Either<Failure, AuthEntity>> signInWithGoogle();

  Future<Either<Failure, AuthEntity>> signInWithFacebook();

  Future<Either<Failure, AuthEntity>> signInWithApple();

  Future<Either<Failure, AuthEntity>> signInAnonymously();

  Future<Either<Failure, AuthEntity>> signOut();
}
