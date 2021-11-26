import 'package:flutter/material.dart';

import '/screens/filters_screen.dart';
import '/screens/tabs_screen.dart';
import 'components/dummy_data.dart';
import 'components/mealapp_theme.dart';
import '/screens/category_meal_screen.dart';
import '/screens/meal_detail_screen.dart';
import 'models/meals.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final theme = MealAppTheme.light();

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree!) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan!) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMeal.routeName: (ctx) => CategoryMeal(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: _filters,
              onSave: _setFilters,
            ),
      },
    );
  }
}
