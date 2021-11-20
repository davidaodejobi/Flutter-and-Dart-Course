import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String? categoryId;
  // final String? categoryTitle;

  const CategoryMeal({
    // this.categoryId,
    // this.categoryTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title!);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
