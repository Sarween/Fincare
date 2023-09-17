import 'package:fincare2023/database.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseManager {
  MySqlConnection? _connection;

  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  Future<MySqlConnection> getConnection() async {
    if (_connection == null) {
      _connection = await openDatabaseConnection();
    }
    return _connection!;
  }

  Future<void> closeConnection() async {
    if (_connection != null) {
      await _connection!.close();
      _connection = null;
      debugPrint('Database connection closed');
    }
  }
}
