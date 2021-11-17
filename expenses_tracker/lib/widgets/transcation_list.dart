import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

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
              return TransactionItem(
                  transaction: userTransactions![index], deleteTx: deleteTx);
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