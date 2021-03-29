import 'dart:convert';
import 'package:app/model/note_model.dart';
import 'package:http/http.dart' as http;

const serverUrl = "http://10.0.2.2:5000/";

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

  void postData(Note note) async {
    var url = Uri.parse(serverUrl);
    var requestBody = <String, dynamic>{
      "title": note.title,
      "category": note.category,
      "description": note.description,
      "content": note.content
    };
    await http.post(url, body: requestBody);

    return;
  }

  void deleteData(id) async {
    var url = Uri.parse('${serverUrl}${id}');
    await http.delete(url);
  }
}
