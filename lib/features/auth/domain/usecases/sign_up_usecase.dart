import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository _authRepository;

  SignUpUsecase(this._authRepository);

  Future<Either<Failure, dynamic>> call(AuthEntity params) async {
    if (!params.isValid) {
      return const Left(Failure(message: 'invalid email'));
    }
    if (params.password.length < 6) {
      return const Left(Failure(
        message: 'Password must be at least 6 characters long',
      ));
    }

    return await _authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      username: params.username ?? '',
      firstName: params.firstName ?? '',
      lastName: params.lastName ?? '',
      phoneNumber: params.phoneNumber ?? '',
      address: params.address ?? '',
      city: params.city ?? '',
    );
  }
}
