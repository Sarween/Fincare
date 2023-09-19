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

Future<List<Map<String, dynamic>>> getTransactionData(
    MySqlConnection connection) async {
  try {
    // Execute the SQL query to get the latest transaction
    final Results results = await connection.query(
      'SELECT * FROM transaction ORDER BY datetime DESC LIMIT 10',
    );

    List<Map<String, dynamic>> transactionList = [];

    // Iterate through the results and convert each row into a Map
    for (var row in results) {
      Map<String, dynamic> transactionData = {
        'transaction_id': row[0], // Assuming the first column is 'id'
        'amount': row[1], // Replace with the correct column index
        'description': row[2], // Replace with the correct column index
        'category': row[3], // Replace with the correct column index
        'recipient_id': row[4], // Replace with the correct column index
        'datetime': row[5], // Replace with the correct column index
        // Add more fields as needed
      };
      transactionList.add(transactionData);
    }

    // Debug print the transactionList
    debugPrint(transactionList.toString());

    // Return the list of transactions
    return transactionList;
  } catch (error) {
    print('Error fetching latest transaction data: $error');
    throw error;
  }
}

Future<Map<String, dynamic>> getLatestTransactionData(
  MySqlConnection connection,
) async {
  try {
    // Execute the SQL query to get the latest transaction
    final Results results = await connection.query(
      'SELECT * FROM transaction ORDER BY datetime DESC LIMIT 1',
    );

    if (results.isNotEmpty) {
      var row = results.first; // Get the first row (latest transaction)

      Map<String, dynamic> transactionData = {
        'transaction_id': row[0], // Assuming the first column is 'id'
        'amount': row[1], // Replace with the correct column index
        'description': row[2], // Replace with the correct column index
        'category': row[3], // Replace with the correct column index
        'recipient_id': row[4], // Replace with the correct column index
        'datetime': row[5], // Replace with the correct column index
        // Add more fields as needed
      };

      // Debug print the transactionData
      debugPrint(transactionData['description'].toString());

      // Return the transaction data as a single object
      return transactionData;
    } else {
      // Handle the case when no transactions are found
      return {}; // You can return an empty map or handle it differently
    }
  } catch (error) {
    print('Error fetching latest transaction data: $error');
    throw error;
  }
}

Future<void> insertTransferMoneyData(
  MySqlConnection connection,
  int amount,
  String description,
  String category,
  int recipient_id,
) async {
  try {
    final transaction_id = generateTransactionId();
    final datetime = DateTime.now(); // Get the current DateTime

    // Define your SQL query for inserting data
    final query =
        'INSERT INTO transaction (transaction_id, amount, description, category, recipient_id, datetime) VALUES (?, ?, ?, ?, ?, ?)';

    final formattedDateTime = datetime.toLocal().toString();

    // Execute the query with the provided data
    final results = await connection.query(query, [
      transaction_id,
      amount,
      description,
      category,
      recipient_id,
      formattedDateTime
    ]);

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


