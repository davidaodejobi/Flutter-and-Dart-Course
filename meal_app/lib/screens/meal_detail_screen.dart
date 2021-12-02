import 'package:flutter/material.dart';

import '/components/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function? toggleFavorite;
  final Function? isFavorite;
  const MealDetailScreen({this.toggleFavorite, this.isFavorite, Key? key})
      : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'] as String;
    final mealIngredients = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(mealIngredients.title!),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavorite!(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => toggleFavorite!(mealId),

          // () {
          //   Navigator.of(context).pop(mealId);
          // },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealIngredients.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              buildHeading(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(mealIngredients.ingredients![index]),
                    ),
                  ),
                  itemCount: mealIngredients.ingredients!.length,
                ),
              ),
              buildHeading(context, 'Steps'),
              buildContainer(
                context,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${(index + 1)}'),
                          ),
                          title: Text(
                            mealIngredients.steps![index],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    itemCount: mealIngredients.steps!.length,
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ));
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Container buildHeading(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
