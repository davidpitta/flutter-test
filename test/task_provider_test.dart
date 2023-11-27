import 'package:exercicio_provider/models/task.dart';
import 'package:exercicio_provider/provider/task_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  test("Adicionar task", () {
    final taskProvider = TaskProvider();
    taskProvider
        .addTask(Task(id: const Uuid().v4(), name: "Teste", concluida: false));
    expect(taskProvider.tasks.length, 1);
  });

  test("Deletar task", () {
    final taskProvider = TaskProvider();
    Task task = Task(id: const Uuid().v4(), name: "Teste", concluida: false);
    taskProvider.addTask(task);
    taskProvider.removeTasks(task);
    expect(taskProvider.tasks.length, 0);
  });

  test("Concluir task", () {
    final taskProvider = TaskProvider();
    Task task = Task(id: const Uuid().v4(), name: "Teste", concluida: false);
    taskProvider.addTask(task);
    taskProvider.taskConcluida(task);
    expect(taskProvider.tasks[0].concluida, true);
    taskProvider.taskConcluida(task);
    expect(taskProvider.tasks[0].concluida, false);
  });
}
