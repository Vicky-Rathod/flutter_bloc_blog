import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_bloc_blog/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late SignUpUsecase signUpUsecase;

  setUp(() {
    authRepository = MockAuthRepository();
    signUpUsecase = SignUpUsecase(authRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'Password123';
  const tUsername = 'testuser';
  const tFirstName = 'Test';
  const tLastName = 'User';
  const tPhoneNumber = '1234567890';
  const tAddress = '123 Test St';
  const tCity = 'Test City';
  const tAuthEntity = AuthEntity(
    email: tEmail,
    password: tPassword,
    username: tUsername,
    firstName: tFirstName,
    lastName: tLastName,
    phoneNumber: tPhoneNumber,
    address: tAddress,
    city: tCity,
  );

  test('should return AuthEntity on successful sign-up', () async {
    // Arrange
    when(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Right(tAuthEntity));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: tEmail,
      password: tPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(result, const Right(tAuthEntity));
    verify(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: tPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));
    verifyNoMoreInteractions(authRepository);
  });

  test('should return Failure on invalid email', () async {
    // Arrange
    const invalidEmail = 'invalidemail';
    when(authRepository.signUpWithEmailAndPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Left(Failure(
          message: 'invalid email',
        )));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: invalidEmail,
      password: tPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(result, const Left(Failure(message: 'invalid email')));
  });

  test('should return Failure on weak password', () async {
    // Arrange
    const weakPassword = '123';
    when(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Left(Failure(
          message: 'Password must be at least 6 characters long',
        )));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: tEmail,
      password: weakPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(
        result,
        const Left(Failure(
          message: 'Password must be at least 6 characters long',
        )));
  });

  test('should return Failure on missing required fields', () async {
    // Arrange
    const missingUsername = '';
    when(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Left(Failure(
          message: 'Missing required fields',
        )));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: tEmail,
      password: tPassword,
      username: missingUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(
        result,
        const Left(Failure(
          message: 'Missing required fields',
        )));
  });

  test('should return Failure on server error', () async {
    // Arrange
    when(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Left(Failure(
          message: 'Server error',
        )));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: tEmail,
      password: tPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(
        result,
        const Left(Failure(
          message: 'Server error',
        )));
  });

  test('should return Failure on network error', () async {
    // Arrange
    when(authRepository.signUpWithEmailAndPassword(
      email: tEmail,
      password: anyNamed('password'),
      username: anyNamed('username'),
      firstName: anyNamed('firstName'),
      lastName: anyNamed('lastName'),
      phoneNumber: anyNamed('phoneNumber'),
      address: anyNamed('address'),
      city: anyNamed('city'),
    )).thenAnswer((_) async => const Left(Failure(
          message: 'Network error',
        )));

    // Act
    final result = await signUpUsecase.call(const AuthEntity(
      email: tEmail,
      password: tPassword,
      username: tUsername,
      firstName: tFirstName,
      lastName: tLastName,
      phoneNumber: tPhoneNumber,
      address: tAddress,
      city: tCity,
    ));

    // Assert
    expect(
        result,
        const Left(Failure(
          message: 'Network error',
        )));
  });
}
