import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  List<String> messages = ['message 1', 'message 2'];

  @override
  void initState() {
    super.initState();
  }

  void connectWithServer() {
    const String serverUrl = "http://10.0.2.2:5000/";

    io.Socket socket = io.io(serverUrl);
    socket.onConnect((_) {
      print("connected to server");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 100.0,
        ),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int idx) {
          return Text(messages[idx]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          // send a message
        },
      ),
    );
  }
}
