import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User curretUser;

  CreatePostContainer({@required this.curretUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.orange,
    );
  }
}
