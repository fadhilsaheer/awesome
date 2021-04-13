import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todo_model.dart';
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

  insertData(data) async {
    var connection = await database;
    return await connection.insert("todos", data);
  }

  fetchData() async {
    var connection = await database;
    return await connection.query("todos");
  }
}