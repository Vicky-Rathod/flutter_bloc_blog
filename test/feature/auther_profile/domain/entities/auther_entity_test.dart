import 'package:flutter_bloc_blog/features/auther_profile/domain/entities/auther_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AutherEntity', () {
    const autherEntity = AutherEntity(
      name: 'Author Name',
      email: 'author@example.com',
      bio: 'Author bio',
      image: 'author_image_url',
    );

    test('should create an Auther entity with valid data', () {
      expect(autherEntity.name, 'Author Name');
      expect(autherEntity.email, 'author@example.com');
      expect(autherEntity.bio, 'Author bio');
      expect(autherEntity.image, 'author_image_url');
    });

    test('should have a valid name', () {
      expect(autherEntity.name, isNotEmpty);
    });

    test('should have a valid email', () {
      expect(autherEntity.email, contains('@'));
    });

    test('should have a valid bio', () {
      expect(autherEntity.bio, isNotEmpty);
    });

    test('should have a valid image URL', () {
      expect(autherEntity.image, isNotEmpty);
    });
  });
}
