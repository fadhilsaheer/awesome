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

  convertFromDb(data) {
    Todo newData =
        Todo(title: data['title'], done: data['done'] == 1 ? true : false);
    newData.id = data['id'];

    return newData;
  }
}
