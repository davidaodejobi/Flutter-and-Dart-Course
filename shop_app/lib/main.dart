import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/edit_product_screen.dart';
import '/screens/user_product_screen.dart';
import '/screens/orders_screen.dart';
import '/providers/orders.dart';
import '/screens/cart_screen.dart';
import '/screens/product_overview_screen.dart';
import 'providers/theme.dart' as theme;
import 'providers/products.dart';
import 'screens/product_detail_screen.dart';
import 'providers/cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final _theme = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => theme.Theme(isDark: _theme),
        ),
      ],
      child: const Screens(),
    );
  }
}

class Screens extends StatelessWidget {
  const Screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBool = Provider.of<theme.Theme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: theme.ShopAppTheme.getTheme(themeBool.isDark!),
      home: const ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        CartScreen.routeName: (ctx) => const CartScreen(),
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        UserProductScreen.routeName: (ctx) => const UserProductScreen(),
        EditProductScreen.routeName: (ctx) => const EditProductScreen(),
      },
    );
  }
}
