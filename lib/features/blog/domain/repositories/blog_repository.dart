import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';

abstract class BlogRepository {
  Future<Either<Failure, dynamic>> createBlog({
    required title,
    required author,
    required description,
    required url,
    required urlToImage,
    required publishedAt,
    required content,
  });
  Future<Either<Failure, dynamic>> deleteBlog({
    required String id,
  });
  Future<Either<Failure, dynamic>> updateBlog({
    required String id,
  });
  Future<Either<Failure, List<BlogModel>>> getBlogs();
  Future<Either<Failure, dynamic>> getBlogDetail(String blogId);
}
