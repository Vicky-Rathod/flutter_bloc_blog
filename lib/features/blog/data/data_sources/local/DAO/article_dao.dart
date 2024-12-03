import 'package:floor/floor.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(BlogModel article);

  @delete
  Future<void> deleteArticle(BlogModel articleModel);

  @Query('SELECT * FROM blog')
  Future<List<BlogModel>> getArticles();
}
