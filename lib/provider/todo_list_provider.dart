import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  int get numActive =>
      todos.where((Todo todo) => !todo.complete).toList().length;

  int get numCompleted => todos.where((Todo todo) => todo.complete).toList().length;

  // Actions
  void completeAll() {
    _todos = _todos.map((todo) => todo.copyWith(complete: true)).toList();
    notifyListeners();
  }

  void clearCompleted() {
    _todos.removeWhere((todo) => todo.complete);
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleComplete(String todoId) {
    var oldTodo = _todos.firstWhere((it) => it.id == todoId);
    var replaceIndex = _todos.indexOf(oldTodo);
    _todos.replaceRange(replaceIndex, replaceIndex + 1,
        [oldTodo.copyWith(complete: !oldTodo.complete)]);
        notifyListeners();
  }
}
