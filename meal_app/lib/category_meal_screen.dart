import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
    );
  }
}
