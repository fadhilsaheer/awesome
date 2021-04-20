import 'package:sqflite/sqflite.dart';
import './database_connection.dart';

class DatabaseHelper {
  DatabaseConnection _databaseConnection;

  DatabaseHelper() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;
  String _table = "todos";

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  readData() async {
    var connection = await database;
    return connection.query(_table);
  }

  insertData(data) async {
    var connection = await database;
    return await connection.insert(_table, data);
  }

  deleteData(id) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $_table WHERE id = $id");
  }
}
