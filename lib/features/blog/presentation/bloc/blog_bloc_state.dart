import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';

abstract class BlogState {}

class BlogInitialState extends BlogState {}

class BlogLoadingState extends BlogState {}

class BlogLoadedState extends BlogState {
  final List<BlogEntity> blogs;

  BlogLoadedState(this.blogs);
}

class BlogErrorState extends BlogState {
  final String message;

  BlogErrorState(this.message);
}
