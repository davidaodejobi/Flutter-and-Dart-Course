import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/app_drawer.dart';
import '/widgets/order_item.dart';
import '/providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) {
          return OrderItem(
            order: orderData.orders[i],
          );
        },
      ),
    );
  }
}
