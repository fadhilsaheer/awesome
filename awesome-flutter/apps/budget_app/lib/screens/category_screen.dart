import 'package:budget_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen({this.category});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
    );
  }
}
