import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // form state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In To Brew Crew"),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) =>
                    value.isEmpty ? 'Enter a valid email' : null,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) =>
                    value.length < 8 ? 'Enter a strong password' : null,
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signIn(email, password);
                    if (result == null) {
                      setState(
                        () => error = 'could not signin with those credential',
                      );
                    }
                  }
                },
              ),
              SizedBox(height: 12),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}
