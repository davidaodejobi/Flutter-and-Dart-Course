import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  FiltersScreen({
    this.theme,
    this.setTheme,
    this.filters,
    this.onSave,
    this.currentTheme,
    Key? key,
  }) : super(key: key);

  static const routeName = '/filters';

  final Function? onSave;
  final Map<String, bool>? filters;
  bool? theme;
  final Function? setTheme;
  final bool? currentTheme;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var appTheme = false;

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    appTheme = widget.theme ?? false;

    _glutenFree = widget.filters?['gluten'] ?? false;
    _vegetarian = widget.filters?['vegetarian'] ?? false;
    _vegan = widget.filters?['vegan'] ?? false;
    _lactoseFree = widget.filters?['lactose'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              const snackBar = SnackBar(content: Text('Filtered meals saved'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.onSave!(selectedFilters);
            },
          ),
        ],
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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(),
                ),
                buildSwitchListTile('Change Theme', 'Dark or Light Theme',
                    currentValue: appTheme, updateValue: (newTheme) {
                  setState(() {
                    appTheme = newTheme;
                    widget.theme = appTheme;
                    widget.setTheme!(appTheme);
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
