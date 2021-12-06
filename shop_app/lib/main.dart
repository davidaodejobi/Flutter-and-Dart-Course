import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/product_overview_screen.dart';
import '/shopapp_theme.dart';
import 'providers/products.dart';
import 'screens/product_detail_screen.dart';
import 'providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ShopAppTheme.light();

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
      ],
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: theme,
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
