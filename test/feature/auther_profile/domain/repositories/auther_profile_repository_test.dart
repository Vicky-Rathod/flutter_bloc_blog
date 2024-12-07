import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/entities/auther_entity.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/usecases/get_auther_profile.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/remote/blog_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockAutherProfileRepository mockAutherProfileRepository;
  late AppDatabase mockAutherProfileLocalDataSource;
  late BlogApiService mockAutherProfileRemoteDataSource;
  final dio = Dio();
  const autherEntity = AutherEntity(name: 'Author Name', email: 'test@test.com', bio: 'Author bio', image: 'author_image_url');
  setUp(() {
    mockAutherProfileRemoteDataSource = BlogApiService(dio);
    mockAutherProfileRepository = MockAutherProfileRepository();
  });
  test('should get auther profile from repository', () async {
    // arrange
    when(mockAutherProfileRepository.getAutherProfile()).thenAnswer((_) async => const Right([autherEntity]));
    // act
    final result = await GetAutherProfileUseCase(mockAutherProfileRepository).call();
    // assert
    expect(result, const Right([autherEntity]));
    verify(mockAutherProfileRepository.getAutherProfile());
    verifyNoMoreInteractions(mockAutherProfileRepository);
  });
}
