import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const blog = BlogEntity(
    id: 1,
    title: 'title',
    description: 'description',
    author: 'author',
    url: 'url',
    urlToImage: 'urlToImage',
    publishedAt: 'publishedAt',
    content: 'content',
  );
  test('create a Blog entity with valid data', () {
    expect(blog.title, 'title');
    expect(blog.description, 'description');
    expect(blog.author, 'author');
    expect(blog.url, 'url');
    expect(blog.urlToImage, 'urlToImage');
    expect(blog.publishedAt, 'publishedAt');
    expect(blog.content, 'content');
  });
  test('create a Blog entity with invalid data', () {
    expect(
        () => const BlogEntity(
              id: 1,
              title: 'title',
              description: 'description',
              author: 'author',
              url: 'url',
              urlToImage: 'urlToImage',
              publishedAt: 'publishedAt',
              content: 'content',
            ),
        returnsNormally);
  });
}
