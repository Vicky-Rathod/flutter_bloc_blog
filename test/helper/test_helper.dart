import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc_blog/features/auther_profile/domain/repositories/auther_profile_repository.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  AuthRepository,
  BlogRepository,
  AutherProfileRepository,
], customMocks: [
  MockSpec<http.Client>(
    as: #MockHttpClient,
  )
])
void main() {}
