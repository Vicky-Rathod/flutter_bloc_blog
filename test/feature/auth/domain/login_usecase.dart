import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_bloc_blog/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late LoginUsecase loginUsecase;
  setUp(() {
    authRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(authRepository);
  });

  test('test Sign in', () async {
    const authEntity = AuthEntity(email: 'email@email.com', password: 'password', username: 'username', address: 'address', city: 'city');
    when(authRepository.signInWithEmailAndPassword(
      email: authEntity.email,
      password: authEntity.password,
    )).thenAnswer((_) async => const Right(authEntity));
    final result = await loginUsecase.call(authEntity);
    expect(result, const Right(authEntity));
  });
}
