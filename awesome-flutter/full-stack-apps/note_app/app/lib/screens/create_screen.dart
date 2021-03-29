import 'package:app/model/network.dart';
import 'package:app/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CreateNote extends StatefulWidget {
  final Function loadContent;

  CreateNote({this.loadContent});

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  String title = '';
  String description = '';
  String content = '';
  String category = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void postData() async {
      setState(() {
        isLoading = true;
      });
      Network networkHelper = Network();
      await networkHelper.postData(Note(
        title: title,
        category: category,
        description: description,
        content: content,
      ));
      widget.loadContent();
      Navigator.pop(context);
    }

    return isLoading
        ? Scaffold(
            backgroundColor: primaryColor,
            body: SpinKitFoldingCube(
              color: secondayrColor,
            ),
          )
        : Scaffold(
            backgroundColor: primaryColor,
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              color: primaryColor,
              child: ListView(
                children: [
                  Text(
                    "Create Note",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter title',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondayrColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appGreen, width: 2.0),
                      ),
                    ),
                    style: TextStyle(
                      color: appWhite,
                    ),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter category',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondayrColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appGreen, width: 2.0),
                      ),
                    ),
                    style: TextStyle(
                      color: appWhite,
                    ),
                    onChanged: (value) {
                      category = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Enter description',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondayrColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appGreen, width: 2.0),
                      ),
                    ),
                    style: TextStyle(
                      color: appWhite,
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Enter content',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondayrColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appGreen, width: 2.0),
                      ),
                    ),
                    style: TextStyle(
                      color: appWhite,
                    ),
                    onChanged: (value) {
                      content = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    onPressed: () {
                      if (title != '' &&
                          category != '' &&
                          description != '' &&
                          content != '') {
                        postData();
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height: 200.0,
                                  child: Scaffold(
                                    backgroundColor: secondayrColor,
                                    body: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Please complete the form !!",
                                            style: TextStyle(
                                              color: appWhite,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "I will complete",
                                              style: TextStyle(
                                                color: appRed,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 15.0,
                      ),
                    ),
                    color: appGreen,
                    elevation: 0.0,
                  ),
                  SizedBox(height: 2.0),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 15.0,
                      ),
                    ),
                    color: appRed,
                    elevation: 0.0,
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          );
  }
}
