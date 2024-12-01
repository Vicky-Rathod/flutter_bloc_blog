import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';

class DeleteBlogUseCase {
  final BlogRepository _blogRepository;

  DeleteBlogUseCase(this._blogRepository);

  Future<Either<Failure, dynamic>> call(String id) async {
    return _blogRepository.deleteBlog(id: id);
  }
}
