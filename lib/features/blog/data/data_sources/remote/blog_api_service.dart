import 'dart:developer';

import 'package:flutter_bloc_blog/core/const/constants.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
part 'blog_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class BlogApiService {
  factory BlogApiService(Dio dio) = _BlogApiService;

  @GET('/top-headlines')
  Future<HttpResponse<Map<String, dynamic>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}

Dio createDioWithInterceptor() {
  final dio = Dio();

  // Add an interceptor
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Modify request options, e.g., add headers
        options.headers['Authorization'] = 'Bearer YOUR_API_TOKEN';
        options.headers['Content-Type'] = 'application/json';
        print('Request: ${options.method} ${options.path}');
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        // Handle the response
        log('Response: ${response.statusCode} ${response.data}');
        return handler.next(response); // Continue with the response
      },
      onError: (DioException error, handler) {
        // Handle errors globally
        print('Error: ${error.response?.statusCode} ${error.message}');
        return handler.next(error); // Continue with the error
      },
    ),
  );

  // Optional: Add a logging interceptor
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    responseHeader: true,
    responseBody: true,
  ));

  return dio;
}
