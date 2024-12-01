import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const authEntity = AuthEntity(email: 'email@email.com', password: 'password', username: 'username', address: 'address', city: 'city');
  test('create a Auth entity with valid data', () {
    expect(authEntity.email, 'email@email.com');
    expect(authEntity.password, 'password');
    expect(authEntity.username, 'username');

    expect(authEntity.address, 'address');
    expect(authEntity.city, 'city');
  });
  test('create a Auth entity with invalid data', () {
    expect(
        () => const AuthEntity(email: 'email', password: 'password', username: 'username', address: 'address', city: 'city'), throwsAssertionError);
  });
  test('test Email ', () {
    expect(authEntity.isValid, equals(true));
  });
  test('test Password ', () {
    expect(authEntity.isPasswordValid, equals(true));
  });
}
