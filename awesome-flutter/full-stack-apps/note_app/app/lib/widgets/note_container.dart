import 'package:app/constants.dart';
import 'package:app/model/note_model.dart';
import 'package:app/screens/note_detail.dart';
import 'package:flutter/material.dart';

class NoteContainer extends StatelessWidget {
  final Note note;
  final Function loadContent;

  NoteContainer({this.note, this.loadContent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NoteDetail(note: note, loadContent: loadContent),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: secondayrColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                color: appWhite,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              note.description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              note.category,
              style: TextStyle(
                color: appGreen,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
