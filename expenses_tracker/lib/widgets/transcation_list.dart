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
        ? Column(
            children: [
              Text(
                'No transaction has been added yet!',
                style: ThemeData.light().textTheme.bodyText1,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
                    DateFormat.yMMMd().format(userTransactions![index].date!),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx!(userTransactions![index].id),
                  ),
                ),
              );
            },
            itemCount: userTransactions!.length,
          );
  }
}
