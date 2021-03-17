import 'package:brew_crew/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // for state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text("Sign Up To Brew Crew"),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("Sign In"),
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value.isEmpty ? 'Enter an email' : null,
                      decoration:
                          textFieldDecoration.copyWith(hintText: 'Email'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration:
                          textFieldDecoration.copyWith(hintText: 'Password'),
                      validator: (value) =>
                          value.length < 8 ? 'Enter a strong password' : null,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.register(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'please supply a valid email';
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  ],
                ),
              ),
            ),
          );
  }
}
