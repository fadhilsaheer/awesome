import 'dart:convert';
import 'package:app/model/note_model.dart';
import 'package:http/http.dart' as http;

const serverUrl = "https://a6578b6ca07e.ngrok.io/";

class Network {
  dynamic getNotes() async {
    var url = Uri.parse(serverUrl);
    var response = await http.get(url);

    var responseNotes = json.decode(response.body);
    List<Note> notes = [];

    assert(responseNotes is List);

    for (var note in responseNotes) {
      assert(note is Map);
      notes.add(
        Note(
          title: note['title'],
          category: note['category'],
          description: note['description'],
          content: note['content'],
          id: note['_id'],
        ),
      );
    }

    return notes;
  }
}
