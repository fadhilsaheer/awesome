import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/screens/category_screen.dart';
import 'package:todoapp_with_sqflite/screens/home_screen.dart';
import 'package:todoapp_with_sqflite/services/category_service.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = List<Widget>();

  CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategory();
    categories.forEach((category) {
      setState(() {
        _categoryList.add(ListTile(
          title: Text(category['name']),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.w3schools.com/w3images/photographer.jpg",
                ),
              ),
              accountName: Text("awesome"),
              accountEmail: Text("awesome@awesome.git"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("Categories"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              ),
            ),
            Divider(),
            Column(children: _categoryList)
          ],
        ),
      ),
    );
  }
}
