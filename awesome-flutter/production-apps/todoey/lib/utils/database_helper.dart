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
}
