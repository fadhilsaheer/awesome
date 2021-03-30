import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_stories/data.dart';
import 'package:instagram_stories/models/story_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Instagram Stories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryScreen(stories: stories),
    );
  }
}

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({@required this.stories});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
