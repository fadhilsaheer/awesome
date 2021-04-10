import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: ClipOval(
                  child: Image(
                    image: AssetImage(user.profileImageUrl),
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
