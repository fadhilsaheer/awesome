import 'package:flutter/material.dart';
import 'package:brew_crew/shared/consts.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Update your brew settings',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textFieldDecoration.copyWith(hintText: "Name"),
              validator: (val) => val.isEmpty ? 'Please enter a namer' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(height: 20.0),
            // dropdown
            DropdownButtonFormField(
              value: _currentSugars ?? '0',
              decoration: textFieldDecoration,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val),
            ),
            SizedBox(height: 20.0),
            // slider
            Slider(
              value: (_currentStrength ?? 100).toDouble(),
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val) => setState(
                () => _currentStrength = val.toInt(),
              ),
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {},
            )
          ],
        ),
      ),
    ]);
  }
}
