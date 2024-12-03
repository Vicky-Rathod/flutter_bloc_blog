import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'package:flutter_bloc_blog/core/widgets/custom_textfield.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc_state.dart';

Widget buildSearchRow(double containerWidth, double containerHeight) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomTextField(
          hintText: 'Search',
          fieldType: FieldType.search,
          height: containerHeight,
          width: containerWidth,
          prefixIcon: Icons.search,
          radius: 12,
        ),
      ),
      const Icon(Icons.tune_outlined, size: 30, color: Colors.black),
    ],
  );
}

Widget buildPinnedNotesList(double screenWidth, double screenHeight) {
  return BlocBuilder<BlogBloc, BlogState>(
    builder: (context, state) {
      if (state is BlogLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is BlogLoadedState) {
        final blogs = state.blogs;
        if (blogs.isEmpty) {
          return const Center(child: Text('No pinned blogs found'));
        }
        return SizedBox(
          height: screenHeight * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(3, 3))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.push_pin_outlined, color: Colors.black),
                          Expanded(
                            child: Text(
                              blog.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        blog.description ?? '',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is BlogErrorState) {
        return Center(child: Text(state.message));
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}

Widget buildRecentNotesList(double screenWidth, double screenHeight) {
  return BlocBuilder<BlogBloc, BlogState>(
    builder: (context, state) {
      if (state is BlogLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is BlogLoadedState) {
        final blogs = state.blogs;
        if (blogs.isEmpty) {
          return const Center(child: Text('No recent blogs found'));
        }
        return SizedBox(
          height: screenHeight * 0.3,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(3, 3))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.push_pin_outlined, color: Colors.black),
                            onPressed: () {
                              locater<AppDatabase>().articleDAO.insertArticle(blog.copyWith(isPinned: !blog.isPinned));
                            },
                          ),
                          Expanded(
                            child: Text(
                              blog.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        blog.description ?? '',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is BlogErrorState) {
        return Center(child: Text(state.message));
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}
