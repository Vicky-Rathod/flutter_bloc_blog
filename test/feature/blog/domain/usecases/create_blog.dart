import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/create_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockBlogRepository blogRepository;
  late CreateBlogUseCase createBlog;
  setUp(() {
    blogRepository = MockBlogRepository();
    createBlog = CreateBlogUseCase(blogRepository);
  });

  test('test Create Blog', () async {
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
    when(blogRepository.createBlog(
      title: blogEntity.title,
      author: blogEntity.author,
      description: blogEntity.description,
      url: blogEntity.url,
      urlToImage: blogEntity.urlToImage,
      publishedAt: blogEntity.publishedAt,
      content: blogEntity.content,
    )).thenAnswer((_) async => const Right(blogEntity));
    final result = await createBlog.call(blogEntity);
    expect(result, const Right(blogEntity));
    verify(blogRepository.createBlog(
      title: blogEntity.title,
      author: blogEntity.author,
      description: blogEntity.description,
      url: blogEntity.url,
      urlToImage: blogEntity.urlToImage,
      publishedAt: blogEntity.publishedAt,
      content: blogEntity.content,
    ));
  });
}
