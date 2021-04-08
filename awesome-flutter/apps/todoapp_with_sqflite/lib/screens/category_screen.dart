import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/models/category.dart';
import 'package:todoapp_with_sqflite/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    _categoryList = List<Category>();
    var categories = await _categoryService.readCategory();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id = category['id'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
            ),
            FlatButton(
              child: Text("Save"),
              color: Colors.blue,
              onPressed: () async {
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;

                var result = await _categoryService.saveCategory(_category);
                print(result);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
          title: Text("Categories Form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a category',
                    labelText: 'Category',
                  ),
                  controller: _categoryNameController,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a description',
                    labelText: 'Description',
                  ),
                  controller: _categoryDescriptionController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
          color: Colors.blue,
          elevation: 0.0,
        ),
        title: Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                leading: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_categoryList[index].name),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {},
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showFormDialog(context),
      ),
    );
  }
}
