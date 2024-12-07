import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/delete_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockBlogRepository blogRepository;
  late DeleteBlogUseCase deleteBlog;
  setUp(() {
    blogRepository = MockBlogRepository();
    deleteBlog = DeleteBlogUseCase(blogRepository);
  });

  test('test Delete Blog', () async {
    const blogId = '1';
    when(blogRepository.deleteBlog(id: blogId)).thenAnswer((_) async => const Right(null));
    final result = await deleteBlog.call(blogId);
    expect(result, const Right(null));
    verify(blogRepository.deleteBlog(id: blogId));
  });
}
