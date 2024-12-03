import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_blog/core/network_info.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/data/datasources/local_remote_datasources.dart';
import 'package:flutter_bloc_blog/features/auth/data/repositories_impl/auth_repositories_impl.dart';
import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc_blog/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc_blog/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/remote/blog_api_service.dart';
import 'package:flutter_bloc_blog/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/create_blog.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/delete_blog.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/get_blog.dart';
import 'package:flutter_bloc_blog/features/blog/domain/usecases/get_blog_detail.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';

final locater = GetIt.asNewInstance();

void init() {
  coreConfig();
  dsConfig();
  repoConfig();
  useCaseConfig();
}

Future<void> coreConfig() async {
  locater.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register NetworkInfo
  locater.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locater()));
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locater.registerSingleton<AppDatabase>(database);
  locater.registerSingleton<Dio>(createDioWithInterceptor());
}

void dsConfig() {
  locater.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  locater.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());
  locater.registerLazySingleton<BlogApiService>(() => BlogApiService(locater<Dio>()));
}

void repoConfig() {
  locater.registerLazySingleton<AuthRepository>(() => AuthRepositoriesImpl(locater<AuthRemoteDataSource>(), locater<AuthLocalDataSource>()));
  locater.registerLazySingleton<BlogRepository>(() => BlogRepositoryImpl(locater<AppDatabase>(), blogApiService: locater<BlogApiService>()));
}

void useCaseConfig() {
  locater.registerLazySingleton<LoginUsecase>(() => LoginUsecase(locater<AuthRepository>()));
  locater.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(locater<AuthRepository>()));
  locater.registerLazySingleton<GetBlogUseCase>(() => GetBlogUseCase(locater<BlogRepository>()));
  locater.registerLazySingleton<GetBlogDetailUseCase>(() => GetBlogDetailUseCase(locater<BlogRepository>()));
  locater.registerLazySingleton<CreateBlogUseCase>(() => CreateBlogUseCase(locater<BlogRepository>()));
  locater.registerLazySingleton<DeleteBlogUseCase>(() => DeleteBlogUseCase(locater<BlogRepository>()));
}

void blocConfig() {
  locater.registerFactory<BlogBloc>(() => BlogBloc(locater<BlogRepository>()));
}
