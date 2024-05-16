import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/objectbox.g.dart';
import 'package:todo/todo_app/model/todo_model.dart';

class ObjectBox {
  late final Store store;
  late final Box<TodoModel> todobox;
  ObjectBox._create(this.store) {
    todobox = Box<TodoModel>(store);
  }
  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final store1 =
        Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    return ObjectBox._create(store1);
  }
}
