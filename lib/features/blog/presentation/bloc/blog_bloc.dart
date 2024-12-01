import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc_event.dart';

import 'blog_bloc_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc(this.blogRepository) : super(BlogInitialState()) {
    on<FetchPinnedBlogsEvent>((event, emit) async {
      emit(BlogLoadingState());
      try {
        final result = await blogRepository.getBlogs(); // Ensure getPinnedBlogs() exists
        result.fold(
          (failure) => emit(BlogErrorState(failure.toString())),
          (blogs) => emit(BlogLoadedState(blogs)),
        );
      } catch (e) {
        emit(BlogErrorState(e.toString()));
      }
    });
  }
}
