import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key, required this.transaction, required this.deleteTx})
      : super(key: key);
  final List<Transaction> transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (transaction.isEmpty) {
          return Column(
            children: [
              const Text('No Transactions added yet!'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.5,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              elevation: 5,
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: CircleAvatar(
                      radius: 30,
                      child: Text('\$${transaction[index].amount}'),
                    ),
                  ),
                ),
                title: Text(transaction[index].title),
                subtitle: Text(
                  DateFormat.yMMMd().format(transaction[index].date),
                ),
                trailing: MediaQuery.of(context).size.width > 460
                    ? ElevatedButton.icon(
                        onPressed: () => deleteTx(transaction[index].id),
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                      )
                    : IconButton(
                        onPressed: () => deleteTx(transaction[index].id),
                        color: Theme.of(context).errorColor,
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
              ),
            );
          },
          itemCount: transaction.length,
          shrinkWrap: true,
        );
      },
    );
  }
}
