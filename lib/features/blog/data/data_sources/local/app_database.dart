import 'package:floor/floor.dart';
import 'package:flutter_bloc_blog/features/blog/data/data_sources/local/DAO/article_dao.dart';
import 'package:flutter_bloc_blog/features/blog/data/models/blog_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [BlogModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
