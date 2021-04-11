import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/home_screen.dart';
import 'package:social_media_ui/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  Widget _buildDrawerOption(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(currentUser.backgroundImageUrl),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
            Icons.dashboard,
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icons.chat, 'Chat', () {}),
          _buildDrawerOption(Icons.location_on, 'Map', () {}),
          _buildDrawerOption(Icons.account_circle, 'Your Profile', () {}),
          _buildDrawerOption(Icons.settings, 'Settings', () {}),
          _buildDrawerOption(
            Icons.directions_run,
            'Logout',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
