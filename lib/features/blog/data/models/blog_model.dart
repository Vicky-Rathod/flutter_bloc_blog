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
    required super.isPinned,
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
      isPinned: entity.isPinned,
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
      isPinned: json['isPinned'] ?? false,
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
      isPinned: isPinned,
    );
  }

  BlogModel copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    bool? isPinned,
  }) {
    return BlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}
