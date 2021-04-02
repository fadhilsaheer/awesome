import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        title: Text("Food Delivery"),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Cart ${currentUser.cart.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
