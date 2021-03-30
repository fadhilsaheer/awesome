import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_stories/data.dart';
import 'package:instagram_stories/models/story_model.dart';
import 'package:video_player/video_player.dart';

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
  PageController _pageController;
  VideoPlayerController _videoPlayerController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _videoPlayerController = VideoPlayerController.network(
      widget.stories[2].url,
    )..initialize().then((value) => setState(() {}));
    _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
