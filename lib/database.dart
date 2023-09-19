// database.dart

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:math';

String generateTransactionId() {
  // Get the current timestamp
  final currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number between 1 and 10000
  final random = Random();
  final randomNumber = random.nextInt(10000) + 1;

  // Combine the timestamp and random number to create a unique ID
  final transactionId = '$currentTimeMillis$randomNumber';

  return transactionId;
}

Future<MySqlConnection> openDatabaseConnection() async {
  final settings = ConnectionSettings(
    host: '159.138.82.111',
    port: 3306,
    user: 'root',
    password: '@Chngjunbin0322',
    db: 'fincare',
  );

  try {
    final conn = await MySqlConnection.connect(settings);
    debugPrint('Database connection established');
    return conn;
  } catch (e) {
    debugPrint("Error: $e");
    // Handle error or throw an exception.
    throw 'Unable to connect to the database: $e';
  }
}

Future<void> insertTransferMoneyData(
  MySqlConnection connection,
  int amount,
  String description,
  String category,
  int childrenId,
) async {
  try {
    final transaction_id = generateTransactionId();

    // Define your SQL query for inserting data
    final query =
        'INSERT INTO transaction (transaction_id, amount, description, category, recipient_id) VALUES (?, ?, ?, ?, ?)';

    // Execute the query with the provided data
    final results = await connection.query(
        query, [transaction_id, amount, description, category, childrenId]);

    // Check the results or handle any errors
    if (results.affectedRows! > 0) {
      print(results);
      print('Data inserted successfully.');
    } else {
      print('Data insertion failed.');
    }
  } catch (e) {
    print('Error: $e');
    // Handle the error
  }
}

void selectArticleData(
  MySqlConnection connection,
  int Article_Id,
  String Article_Name,
  String Article_Author,
  String Article_Detail
) async {
  try {

    var results = await connection.query(
      'select Article_Name, Article_Author, Article_Detail from articles where Article_Id = ?', [Article_Id]);
    // for (var row in results) {
    //   print('Article_Name: ${row[0]}, Article_Author: ${row[1]} Article_Detail: ${row[2]}');}
    print(results);

  } catch (e) {
    print('Error: $e');
    // Handle the error

  }
  }


