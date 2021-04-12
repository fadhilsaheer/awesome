class Todo {
  int id;
  String title;
  bool isResolved;

  todoMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['todo'] = title;
    mapping['isResolved'] = isResolved ? 1 : 0;

    return mapping;
  }
}
