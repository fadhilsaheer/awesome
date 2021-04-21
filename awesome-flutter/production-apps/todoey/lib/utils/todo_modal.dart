class Todo {
  String title;
  bool done;
  int id;

  Todo({this.title, this.done});

  convertToDb() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['title'] = title;
    mapping['done'] = done ? 1 : 0;

    return mapping;
  }
}
