import 'package:flutter/material.dart';
import 'package:meal_app/category_meal_screen.dart';

import 'mealapp_theme.dart';
import 'categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = MealAppTheme.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme,
      initialRoute: '/',
      // home: CategoriesScreen(
      //   theme: theme,
      // ),
      routes: {
        '/': (ctx) => CategoriesScreen(
              theme: theme,
            ),
        CategoryMeal.routeName: (ctx) => const CategoryMeal(),
        // '/categories': (context) => CategoriesScreen(
        //       theme: theme,
        //     ),
      },
    );
  }
}
