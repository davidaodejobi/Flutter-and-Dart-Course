import 'package:flutter/material.dart';

class CategoryMeal extends StatelessWidget {
  final String? categoryId;
  final String? categoryTitle;

  const CategoryMeal({
    this.categoryId,
    this.categoryTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
    );
  }
}
