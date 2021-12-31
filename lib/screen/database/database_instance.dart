import 'package:demo_database1/screen/database/mydatabase.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;

  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<AppDatabase> getDatabaseInstance() async {
    return await $FloorAppDatabase.databaseBuilder('my_database.db').build();
  }
}
