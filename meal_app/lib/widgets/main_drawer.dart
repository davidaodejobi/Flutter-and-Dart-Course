import 'package:flutter/material.dart';

import '/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext context, String title, IconData icon,
      VoidCallback tapHandler) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.6),
      child: ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).secondaryHeaderColor,
            child: Text(
              'Modify Things',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            context,
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            context,
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
