import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../components/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({this.theme, Key? key}) : super(key: key);

  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
                svg: catData.svg,
              ),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
