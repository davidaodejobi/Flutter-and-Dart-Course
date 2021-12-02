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
  var theme = false;

  void _setTheme(bool value) {
    setState(() {
      theme = value;
    });
  }

  Map<bool, Object> appTheme = {
    false: MealAppTheme.light(),
    true: MealAppTheme.dark(),
  };

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

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

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: appTheme[theme] as ThemeData,
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMeal.routeName: (ctx) => CategoryMeal(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              theme: theme,
              filters: _filters,
              onSave: _setFilters,
              setTheme: _setTheme,
              currentTheme: theme,
            ),
      },
    );
  }
}
