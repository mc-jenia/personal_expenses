import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New T-shirt',
      amount: 39.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addtx: _addNewTransaction,
        ),
        TransactionList(
          transaction: _userTransaction,
        ),
      ],
    );
  }
}
