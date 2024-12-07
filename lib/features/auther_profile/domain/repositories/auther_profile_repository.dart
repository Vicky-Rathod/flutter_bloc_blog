import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/entities/auther_entity.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';

abstract class AutherProfileRepository {
  Future<Either<Failure, List<AutherEntity>>> getAutherProfile();
}
