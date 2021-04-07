import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/screens/category_screen.dart';
import 'package:todoapp_with_sqflite/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
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
          ],
        ),
      ),
    );
  }
}
