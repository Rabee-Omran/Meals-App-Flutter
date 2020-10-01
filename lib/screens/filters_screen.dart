import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/fliters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _bulidSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _bulidSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals .',
                    _glutenFree,
                    (value) => {
                          setState(() {
                            _glutenFree = value;
                          })
                        }),
                _bulidSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals .',
                    _lactoseFree,
                    (value) => {
                          setState(() {
                            _lactoseFree = value;
                          })
                        }),
                _bulidSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals .',
                    _vegetarian,
                    (value) => {
                          setState(() {
                            _vegetarian = value;
                          })
                        }),
                _bulidSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals .',
                    _vegan,
                    (value) => {
                          setState(() {
                            _vegan = value;
                          })
                        }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
