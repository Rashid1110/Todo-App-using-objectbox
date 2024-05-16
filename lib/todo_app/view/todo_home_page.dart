import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/todo_app/controller/todo_provider.dart';
import 'package:todo/todo_app/model/todo_model.dart';
import 'package:todo/todo_app/view/add_todo_page.dart';

class TodoHomePage extends ConsumerWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListpro);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODO APP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(185, 156, 189, 245),
      ),
      body: todos.isEmpty
          ? const Center(child: Text("No todos yet!"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: todo.completed,
                        onChanged: (bool? value) {
                          ref.read(todoListpro.notifier).update(TodoModel(
                              title: todo.title,
                              id: todo.id,
                              completed: value ?? false));
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            ref.read(todoListpro.notifier).delete(todo.id);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddTodoPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
