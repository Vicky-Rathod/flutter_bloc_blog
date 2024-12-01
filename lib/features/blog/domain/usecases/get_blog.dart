import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';

class GetBlogUseCase {
  final BlogRepository _repository;

  GetBlogUseCase(this._repository);

  Future<Either<Failure, List<BlogEntity>>> execute() async {
    return await _repository.getBlogs();
  }
}
