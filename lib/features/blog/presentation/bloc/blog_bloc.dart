import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'package:flutter_bloc_blog/core/network_info.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc_event.dart';

import 'blog_bloc_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc(this.blogRepository) : super(BlogInitialState()) {
    on<FetchPinnedBlogsEvent>((event, emit) async {
      emit(BlogLoadingState());
      final networkInfo = locater<NetworkInfo>();
      final isConnected = await networkInfo.isConnected;
      if (isConnected) {
        try {
          final result = await blogRepository.getBlogs(); // Ensure getPinnedBlogs() exists
          result.fold(
            (failure) => emit(BlogErrorState(failure.toString())),
            (blogs) => emit(BlogLoadedState(blogs)),
          );
        } catch (e) {
          emit(BlogErrorState(e.toString()));
        }
      } else {
        final blog = await locater.get<AppDatabase>().articleDAO.getArticles();
        emit(BlogLoadedState(blog));
      }
    });
  }
}
