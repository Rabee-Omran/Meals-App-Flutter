import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipes'),
      ),
      body: ListView.builder(

        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (context, index){
          return 
        }
        
        )
    );
  }
}
