import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/theme.dart' as theme;

import '/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<theme.Theme>((context));
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            title: const Text('Modification'),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  icon: Icon(changeTheme.isDark!
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded),
                  onPressed: () {
                    changeTheme.toggleTheme();
                  }),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.youtube_searched_for_sharp),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
