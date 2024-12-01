import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/get_blog_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockBlogRepository blogRepository;
  late GetBlogDetailUseCase getBlogDetail;
  setUp(() {
    blogRepository = MockBlogRepository();
    getBlogDetail = GetBlogDetailUseCase(blogRepository);
  });

  test('test Get Blog Detail', () async {
    const blogEntity = BlogEntity(
      id: 1,
      title: 'title',
      author: 'author',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      publishedAt: 'publishedAt',
      content: 'content',
    );
    when(blogRepository.getBlogDetail(
      blogEntity.id.toString(),
    )).thenAnswer((_) async => const Right(blogEntity));
    final result = await getBlogDetail.execute(blogEntity.id.toString());
    expect(result, const Right(blogEntity));
    verify(blogRepository.getBlogDetail(
      blogEntity.id.toString(),
    ));
  });
}
