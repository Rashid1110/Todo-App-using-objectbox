// import 'package:obj_2/objectbox.g.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/todo_app/model/object_box.dart';
import 'package:todo/todo_app/model/todo_model.dart';

final objectpro = FutureProvider<ObjectBox>((ref) async {
  return await ObjectBox.create();
});

final todoListpro =
    StateNotifierProvider<TodoListNotitier, List<TodoModel>>((ref) {
  final objectBox = ref.watch(objectpro.future);
  return TodoListNotitier(objectBox);
});

class TodoListNotitier extends StateNotifier<List<TodoModel>> {
  late final Future<ObjectBox> _objectBox;
  TodoListNotitier(this._objectBox) : super([]) {
    _objectBox.then((obj) {
      state = obj.todobox.getAll();
    });
  }

//add todo in objectbox

  void add(TodoModel todo) async {
    final obj = await _objectBox;
    obj.todobox.put(todo);
    state = obj.todobox.getAll();
  }

//delete todo in objectbox
  void delete(int id) async {
    final obj = await _objectBox;
    obj.todobox.remove(id);
    state = obj.todobox.getAll();
  }

  //update todo in objectbox
  void update(TodoModel todo) async {
    final obj = await _objectBox;
    obj.todobox.put(todo);
    state = obj.todobox.getAll();
  }
}
