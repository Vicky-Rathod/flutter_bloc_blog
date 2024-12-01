import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRemoteDataSource {
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      if (email == 'test' && password == 'test') {
        return const Right('Login Success');
      }
      // final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      // return Right(userCredential);
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String address,
      required String city}) async {
    try {
      // final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      // return Right(userCredential);
      if (email == '' && password == '' && username == '' && firstName == '' && lastName == '' && phoneNumber == '' && address == '' && city == '') {
        return const Right('Sign Up Success');
      }
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    try {
      // final userCredential = await FirebaseAuth.instance.signInWithGoogle();
      // return Right(userCredential);
      return const Right(AuthEntity(
        email: 'email',
        password: 'password',
        username: 'username',
        firstName: 'firstName',
        lastName: 'lastName',
        phoneNumber: 'phoneNumber',
        address: 'address',
        city: 'city',
      ));
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthEntity>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
