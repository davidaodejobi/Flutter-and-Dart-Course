import 'package:flutter/material.dart';

import 'components/mealapp_theme.dart';
import 'screens/categories_screen.dart';
import '/screens/category_meal_screen.dart';
import '/screens/meal_detail_screen.dart';

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
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        // '/categories': (context) => CategoriesScreen(
        //       theme: theme,
        //     ),
      },
    );
  }
}
