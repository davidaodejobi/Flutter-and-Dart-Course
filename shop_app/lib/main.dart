import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/product_overview_screen.dart';
import '/shopapp_theme.dart';
import 'providers/products.dart';
import 'screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ShopAppTheme.light();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
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
