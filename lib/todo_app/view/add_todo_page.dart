import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/todo_app/controller/todo_provider.dart';
import 'package:todo/todo_app/model/todo_model.dart';

class AddTodoPage extends ConsumerWidget {
  AddTodoPage({super.key});
  final TextEditingController titleCon = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add ToDo..."),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: titleCon,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // _addTodo(context, ref);
                  addTodo(context, ref);
                  // Navigator.pop(context);
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }

  void addTodo(BuildContext context, WidgetRef ref) {
    final String title = titleCon.text.trim();
    if (title.isNotEmpty) {
      final newTodo = TodoModel(title: title);
      ref.read(todoListpro.notifier).add(newTodo);
      Navigator.pop(context);
    }
  }
}
