import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).iconTheme.color,
              size: 28.0,
            ),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
