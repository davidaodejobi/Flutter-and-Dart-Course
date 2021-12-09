import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem? order;
  const OrderItem({this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${order!.amount}'),
              subtitle: Text(
                DateFormat('dd-MM-yyyy hh:mm').format(order!.dateTime!),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.expand_more),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
