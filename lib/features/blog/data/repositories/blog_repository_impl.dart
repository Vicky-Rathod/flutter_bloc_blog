import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/core/const/constants.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/remote/blog_api_service.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogApiService _blogApiService;
  final AppDatabase _appDatabase;

  BlogRepositoryImpl(AppDatabase appDatabase, {required BlogApiService blogApiService})
      : _blogApiService = blogApiService,
        _appDatabase = appDatabase;

  @override
  Future<Either<Failure, dynamic>> createBlog({
    required title,
    required author,
    required description,
    required url,
    required urlToImage,
    required publishedAt,
    required content,
  }) {
    // TODO: implement createBlog
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> deleteBlog({required String id}) {
    // TODO: implement deleteBlog
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> getBlogDetail(String blogId) {
    // TODO: implement getBlogDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BlogModel>>> getBlogs() async {
    try {
      final response = await _blogApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      final List<BlogModel> blogList = [];
      for (final blog in response.data['articles']) {
        blogList.add(BlogModel.fromJson(blog as Map<String, dynamic>));
      }
      return Right(blogList);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateBlog({required String id}) {
    // TODO: implement updateBlog
    throw UnimplementedError();
  }
}
