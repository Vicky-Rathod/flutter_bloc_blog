import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'package:flutter_bloc_blog/features/auth/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_blog/features/auth/presentation/ui/login_screen.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/nav_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<NavbarCubit>(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider<BlogBloc>(
          create: (context) => BlogBloc(locater()),
        ),
      ],
      child: MaterialApp(
          title: 'My App',
          showPerformanceOverlay: true,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Scaffold(body: LoginScreen())),
    );
  }
}
