import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free', 'Onlu include gluten-free meal',
                    currentValue: _glutenFree, updateValue: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free', 'Onlu include lactose-free meal',
                    currentValue: _lactoseFree, updateValue: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                buildSwitchListTile(
                    'Vegeterian', 'Onlu include vegeterian meal',
                    currentValue: _vegetarian, updateValue: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                buildSwitchListTile('Vegan', 'Onlu include vegan meal',
                    currentValue: _vegan, updateValue: (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String description,
      {bool? currentValue, ValueChanged<bool>? updateValue}) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue!,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
