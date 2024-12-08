import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/cubit/locale_cubit.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/home_view.dart';
import 'package:flutter_bloc_blog/localization/app_localizations.dart';
import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}
