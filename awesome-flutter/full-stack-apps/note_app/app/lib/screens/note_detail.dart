import 'package:app/constants.dart';
import 'package:app/model/network.dart';
import 'package:app/model/note_model.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  final Note note;

  NoteDetail({this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title.toUpperCase(),
                  style: TextStyle(
                    color: appWhite,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: appGreen,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline),
                      color: appRed,
                      onPressed: () async {
                        Network networkHelper = Network();
                        await networkHelper.deleteData(note.id);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              note.description,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              note.category,
              style: TextStyle(
                color: appGreen,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              note.content,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
