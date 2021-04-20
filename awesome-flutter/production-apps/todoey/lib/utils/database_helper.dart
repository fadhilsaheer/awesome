import 'package:sqflite/sqflite.dart';
import './database_connection.dart';

class DatabaseHelper {
  DatabaseConnection _databaseConnection;

  DatabaseHelper() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;
}
