import 'package:flutter/material.dart';

import '/screens/product_overview_screen.dart';
import '/shopapp_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = ShopAppTheme.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: theme,
      home: ProductsOverviewScreen(),
    );
  }
}
