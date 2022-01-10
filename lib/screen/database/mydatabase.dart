import 'dart:async';
import 'package:demo_database1/screen/dao/persondao.dart';
import 'package:demo_database1/screen/entity/person.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'mydatabase.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}

