import 'package:exercicio_provider/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercicio_provider/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(controller: _textController),
            ElevatedButton(
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false).addTask(
                      Task(
                          id: const Uuid().v4(),
                          name: _textController.text,
                          concluida: false));
                },
                child: const Text("Save")),
            Expanded(child: Consumer<TaskProvider>(
                builder: (context, TaskProvider taskProvider, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(taskProvider.tasks[index].name),
                        trailing: Wrap(children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => {
                              Provider.of<TaskProvider>(context, listen: false)
                                  .removeTasks(taskProvider.tasks[index])
                            },
                          ),
                          Checkbox(
                              value: taskProvider.tasks[index].concluida,
                              onChanged: (value) {
                                Provider.of<TaskProvider>(context,
                                        listen: false)
                                    .taskConcluida(taskProvider.tasks[index]);
                              })
                        ]));
                  });
            }))
          ],
        ),
      ),
    );
  }
}
