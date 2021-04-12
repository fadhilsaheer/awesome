import 'package:sqflite/sqflite.dart';
import './database_connection.dart';

class TodoHelper {
  DatabaseConnection _databaseConnection;

  TodoHelper() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }
}
