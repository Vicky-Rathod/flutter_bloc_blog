import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';

class CreateBlogUseCase {
  final BlogRepository _blogRepository;

  CreateBlogUseCase(this._blogRepository);

  Future<Either<Failure, dynamic>> call(BlogEntity blog) async {
    return await _blogRepository.createBlog(
      title: blog.title,
      author: blog.author,
      description: blog.description,
      url: blog.url,
      urlToImage: blog.urlToImage,
      publishedAt: blog.publishedAt,
      content: blog.content,
    );
  }
}
