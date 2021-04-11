import 'package:flutter/material.dart';
import 'package:social_media_ui/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(Image(
              image: AssetImage(),
            ))
          ],
        ),
      ),
    );
  }
}
