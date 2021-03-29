import 'package:app/constants.dart';
import 'package:app/model/network.dart';
import 'package:app/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NoteDetail extends StatefulWidget {
  final Note note;
  final Function loadContent;

  NoteDetail({this.note, this.loadContent});

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void deleteNote() {
      setState(() => isLoading = true);
      Network networkHelper = Network();
      networkHelper.deleteData(widget.note.id);
      widget.loadContent();
      Navigator.pop(context);
    }

    return isLoading
        ? Scaffold(
            backgroundColor: primaryColor,
            body: SpinKitFoldingCube(color: secondayrColor),
          )
        : Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.note.title.toUpperCase(),
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
                            onPressed: () => deleteNote(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    widget.note.description,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    widget.note.category,
                    style: TextStyle(
                      color: appGreen,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    widget.note.content,
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
