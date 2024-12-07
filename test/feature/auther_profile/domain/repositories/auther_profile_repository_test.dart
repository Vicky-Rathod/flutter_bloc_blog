import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockAutherProfileRepository mockAutherProfileRepository;
  late MockAutherProfileLocalDataSource mockAutherProfileLocalDataSource;
  late MockAutherProfileRemoteDataSource mockAutherProfileRemoteDataSource;
  setUp(() {
   
    mockAutherProfileLocalDataSource = MockAutherProfileLocalDataSource();
    mockAutherProfileRemoteDataSource = MockAutherProfileRemoteDataSource();
     mockAutherProfileRepository = MockAutherProfileRepository(mockAutherProfileLocalDataSource, mockAutherProfileRemoteDataSource);
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
