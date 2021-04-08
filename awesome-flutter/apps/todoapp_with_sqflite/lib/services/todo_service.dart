import 'package:todoapp_with_sqflite/models/todo.dart';
import 'package:todoapp_with_sqflite/repositories/repository.dart';

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }

  readTodos() async {
    return await _repository.readData('todos');
  }

  readTodosByCategory(category) async {
    return await _repository.readDataByColumnName(
      'todos',
      'category',
      category,
    );
  }
}
