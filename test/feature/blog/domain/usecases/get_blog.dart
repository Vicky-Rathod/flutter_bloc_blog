import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/get_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockBlogRepository blogRepository;
  late GetBlogUseCase getBlog;
  setUp(() {
    blogRepository = MockBlogRepository();
    getBlog = GetBlogUseCase(blogRepository);
  });

  test('get Blog List', () async {
    const blogEntity = BlogModel(
      id: 1,
      title: 'title',
      author: 'author',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      publishedAt: 'publishedAt',
      content: 'content',
      isPinned: false,
    );
    when(blogRepository.getBlogs()).thenAnswer((_) async => const Right([blogEntity]));
    final result = await getBlog.execute();
    expect(result, const Right([blogEntity]));
    verify(blogRepository.getBlogs());
  });
}
