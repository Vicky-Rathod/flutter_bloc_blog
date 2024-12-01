import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/local_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/data/repositories_impl/auth_repositories_impl.dart';
import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repositories.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late AuthRepository authRepository;
  late MockAuthRemoteDataSource authDataSource;
  late MockAuthLocalDataSource authLocalDataSource;
  setUp(() {
    authDataSource = MockAuthRemoteDataSource();
    authLocalDataSource = MockAuthLocalDataSource();
    authRepository = AuthRepositoriesImpl(authDataSource, authLocalDataSource);
  });
  test('test Remote Sign in', () {
    when(authDataSource.signInWithEmailAndPassword(
      email: 'email',
      password: 'password',
    )).thenAnswer((_) async => const Right(true));
    expect(authDataSource.signInWithEmailAndPassword(email: 'email', password: 'password'), completion(equals(const Right(true))));
  });
}
