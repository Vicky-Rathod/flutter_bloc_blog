import 'package:floor/floor.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';

@Entity(tableName: 'blog', primaryKeys: ['id'])
class BlogModel extends BlogEntity {
  const BlogModel({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });
  factory BlogModel.fromEntity(BlogEntity entity) {
    return BlogModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
      author: entity.author,
    );
  }
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
  BlogEntity toEntity() {
    return BlogEntity(
      id: id,
      title: title,
      author: author,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
