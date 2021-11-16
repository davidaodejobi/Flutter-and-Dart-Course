import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? userTransactions;
  final Function? deleteTx;

  // ignore: use_key_in_widget_constructors
  const TransactionList({this.userTransactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return userTransactions!.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transaction has been added yet!',
                    style: ThemeData.light().textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${userTransactions![index].amount}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions![index].title!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      userTransactions![index].date!,
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          onPressed: () =>
                              deleteTx!(userTransactions![index].id),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          label: const Text('Delete',
                              style: TextStyle(color: Colors.red)),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTx!(userTransactions![index].id),
                        ),
                ),
              );
            },
            itemCount: userTransactions!.length,
          );
  }
}

/*
 trailing: MediaQuery.of(context).size.width > 360
                      ? TextButton(
                          onPressed: () =>
                              deleteTx!(userTransactions![index].id),
                          child: Row(
                            children: const [
                              Icon(Icons.delete),
                              Text('Delete'),
                            ],
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTx!(userTransactions![index].id),
                        ),
*/