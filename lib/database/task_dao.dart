import 'package:to_do/database/app_database.dart';
import 'package:to_do/models/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = "CREATE TABLE $_tableName("
    "$_id INTEGER PRIMARY KEY, "
    "$_title TEXT, "
    "$_targetData STRING, "
    "$_color INTEGER, "
    "$_icon INTEGER)";
  
  static const String _tableName = "";
  static const String _id = "id";
  static const String _title = "title";
  static const String _targetData = "target_data";
  static const String _color = "color";
  static const String _icon = "icon";

  Future<int> save(Task task) async {
    final Database db = await getDataBase();
    Map<String, dynamic> taskMap = _toMap(task);
    return db.insert(_tableName, taskMap);
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Task> tasks = _toList(result);
    return tasks;
  }

  Map<String, dynamic> _toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_title] = task.title;
    taskMap[_targetData] = task.deadLineDate;
    taskMap[_color] = task.color.value;
    taskMap[_icon] = task.icon.codePoint;
    return taskMap;
  }

  List<Task> _toList(List<Map<String, dynamic>> result) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in result) {
      final Task task = Task(
        id: row[_id],
        title: row[_title],
        deadLineDate: row[_targetData],
        color: row[_color],
        icon: row[_icon],
      );
      tasks.add(task);
    }
    return tasks;
  }
}

/* 
Icons.add.codePoint
Colors.white.value
*/