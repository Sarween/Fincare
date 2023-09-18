import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';

class Mysql {
  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: '159.138.82.111',
        port: 3306,
        user: "root",
        password: "@Chngjunbin0322",
        db: "fincare");

    try {
      final conn = await MySqlConnection.connect(settings);
      debugPrint('Database connection established');
      return conn;
    } catch (e) {
      debugPrint("Error: $e");
      print("Error");
      throw 'Unable to connect';
    }
    // return await MySqlConnection.connect(settings);
  }
}
