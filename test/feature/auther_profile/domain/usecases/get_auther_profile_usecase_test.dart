import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/entities/auther_entity.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/usecases/get_auther_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockAutherProfileRepository mockAutherProfileRepository;
  late GetAutherProfileUseCase getAutherProfileUsecase;
  const autherEntity = AutherEntity(name: 'Author Name', email: 'author@example.com', bio: 'Author bio', image: 'author_image_url');
  setUp(() {
    mockAutherProfileRepository = MockAutherProfileRepository();
    getAutherProfileUsecase = GetAutherProfileUseCase(mockAutherProfileRepository);
  });
  test('should get auther profile from repository', () async {
    // arrange
    when(mockAutherProfileRepository.getAutherProfile()).thenAnswer((_) async => const Right([autherEntity]));
    // act
    final result = await getAutherProfileUsecase.call();
    // assert
    expect(result, const Right([autherEntity]));
    verify(mockAutherProfileRepository.getAutherProfile());
    verifyNoMoreInteractions(mockAutherProfileRepository);
  });
}
