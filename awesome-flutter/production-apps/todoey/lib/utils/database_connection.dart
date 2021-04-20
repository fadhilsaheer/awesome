import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'todoey');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDatabase,
    );
  }

  _onCreateDatabase(Database database, int version) async {
    await database.execute(
      'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, isResolved INTEGER)',
    );
  }
}
