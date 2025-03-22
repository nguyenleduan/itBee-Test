import 'package:intl/intl.dart';
import 'package:itbeesolutionstest/config/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

    Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT,
            status INTEGER NOT NULL DEFAULT 0,
            due_date TEXT,
            prioritize TEXT,
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            updated_at TEXT DEFAULT CURRENT_TIMESTAMP
          )''',
        );
      },
    );
  }

  Future<int> insertTask(TaskModel task) async {
    final db = await database;
    try {
      return await db.insert('tasks', task.toMap());
    } catch (e) {
      print('Lỗi khi insert task: $e');
      return -1;
    }
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query('tasks');
      List<TaskModel> tasks = List.generate(
          maps.length, (i) => TaskModel.fromMap(maps[i]));
      tasks.sort((a, b) {
        DateTime now = DateTime.now();
        String formattedNow = DateFormat('dd/MM/yyyy').format(now);

        if(a.dueDate == '' && b.dueDate == ''){
          return 0;
        } else if(a.dueDate == ''){
          return 1;
        } else if(b.dueDate == ''){
          return -1;
        }

        try {
          DateTime dateA = DateFormat('dd/MM/yyyy').parse(a.dueDate);
          DateTime dateB = DateFormat('dd/MM/yyyy').parse(b.dueDate);
          return dateA.compareTo(dateB);
        } catch (e) {
          return 0;
        }
      });

      return tasks;
    } catch (e) {
      return [];
    }
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await database;
    try {
      return await db.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (e) {
      return -1;
    }
  }

  Future<int> updateDoneTask(TaskModel task) async {
    final db = await database;
    task.status = 1;
    try {
      return await db.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (e) {
      return -1;
    }
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    try {
      return await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      return -1;
    }
  }
  Future close() async {
    final db = await _database;
    db!.close();
  }

  Future<void> deleteTaskTable() async {
    final db = await database;
    try {
      await db.execute('DROP TABLE IF EXISTS tasks');
    } catch (e) {
      //
    }
  }
}