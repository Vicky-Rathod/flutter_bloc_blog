import 'package:flutter/material.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}
