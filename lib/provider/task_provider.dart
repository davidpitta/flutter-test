import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTasks(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void taskConcluida(Task task) {
    task.concluida = !task.concluida;
    notifyListeners();
  }
}
