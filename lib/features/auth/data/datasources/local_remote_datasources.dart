import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthData(AuthEntity authEntity);
  Future<AuthEntity?> getAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheAuthData(AuthEntity authEntity) async {}

  @override
  Future<AuthEntity?> getAuthData() {
    throw UnimplementedError();
  }
}
