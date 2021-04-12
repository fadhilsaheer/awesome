import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'todo_db');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreatingDatabase,
    );
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
      'CREATE TABLE todos(id INTEGER PRIMARY KEY, todo TEXT, isResolved INTEGER)',
    );
  }
}
