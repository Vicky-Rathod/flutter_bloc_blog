import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';

class GetBlogDetailUseCase {
  final BlogRepository _blogRepository;

  GetBlogDetailUseCase(this._blogRepository);

  Future<Either<Failure, dynamic>> execute(String blogId) {
    return _blogRepository.getBlogDetail(blogId);
  }
}
