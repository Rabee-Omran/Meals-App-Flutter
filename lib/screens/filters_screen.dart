import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/fliters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.saveFilters, this.currentFilters);

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
  void initState() {
     _glutenFree = widget.currentFilters['gluten'];
  _vegetarian = widget.currentFilters['lactose'];
   _vegan = widget.currentFilters['vegan'];
  _lactoseFree = widget.currentFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
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
