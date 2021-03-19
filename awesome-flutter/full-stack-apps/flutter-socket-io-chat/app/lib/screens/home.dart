import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IO.Socket socket;

  @override
  void initState() {
    super.initState();
    connectedServer();
  }

  void connectedServer() {
    socket = IO.io('https://3709962de91d.ngrok.io', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
