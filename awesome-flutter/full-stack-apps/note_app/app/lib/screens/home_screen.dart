import 'package:app/constants.dart';
import 'package:app/model/network.dart';
import 'package:app/model/note_model.dart';
import 'package:app/screens/create_screen.dart';
import 'package:app/widgets/note_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  GlobalKey<RefreshIndicatorState> refreshKey;

  List<Widget> _appList = [
    Text(
      'My Notes',
      style: TextStyle(
        color: appWhite,
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    SizedBox(height: 40.0),
  ];

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    fetchAndAppendNotes();
  }

  void loadContent() {
    setState(() {
      isLoading = true;
      _appList = [
        Text(
          'My Notes',
          style: TextStyle(
            color: appWhite,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 40.0),
      ];
    });
    fetchAndAppendNotes();
  }

  void fetchAndAppendNotes() async {
    Network networkHelper = Network();
    List<Note> notes = await networkHelper.getNotes();
    setState(() {
      for (Note note in notes) {
        _appList.add(NoteContainer(note: note));
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: primaryColor,
            body: SpinKitFoldingCube(
              color: secondayrColor,
            ),
          )
        : RefreshIndicator(
            key: refreshKey,
            color: secondayrColor,
            onRefresh: () {
              loadContent();
            },
            child: Scaffold(
              backgroundColor: primaryColor,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateNote(loadContent: loadContent),
                    ),
                  );
                },
                backgroundColor: appGreen,
                child: Icon(Icons.add, size: 35.0),
              ),
              body: SafeArea(
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                  itemCount: _appList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _appList[index];
                  },
                ),
              ),
            ),
          );
  }
}
