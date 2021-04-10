import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/login_background.jpg'),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
              ),
              Text(
                'FRENZY',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
