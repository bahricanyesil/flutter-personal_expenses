import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required Function deleteTransaction,
  }) : _deleteTransaction = deleteTransaction, super(key: key);

  final Transaction transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          '${transaction.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat().add_yMMMd().format((transaction.date)),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text('Delete'),
                onPressed: () {
                  _deleteTransaction(transaction.id);
                })
            : IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  _deleteTransaction(transaction.id);
                },
              ),
      ),
    );
  }
}
