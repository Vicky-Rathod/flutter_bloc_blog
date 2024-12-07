import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/entities/auther_entity.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/repositories/auther_profile_repository.dart';

class GetAutherProfileUseCase {
  final AutherProfileRepository repository;

  GetAutherProfileUseCase(this.repository);

  Future<Either<Failure, List<AutherEntity>>> call() async {
    return await repository.getAutherProfile();
  }
}
