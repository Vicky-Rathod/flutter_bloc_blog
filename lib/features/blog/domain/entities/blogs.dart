import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final bool isPinned;

  const BlogEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    this.isPinned = false,
  });

  @override
  List<Object?> get props => [id, title, author, description, url, urlToImage, publishedAt, content, isPinned];
}
