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

  // Thêm Task
  Future<int> insertTask(TaskModel task) async {
    final db = await database;
    try {
      return await db.insert('tasks', task.toMap());
    } catch (e) {
      // Xử lý lỗi ở đây, ví dụ: in log, trả về -1, v.v.
      print('Lỗi khi insert task: $e');
      return -1;
    }
  }

  // Lấy tất cả Task
  Future<List<TaskModel>> getAllTasks() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query('tasks');
      return List.generate(maps.length, (i) => TaskModel.fromMap(maps[i]));
    } catch (e) {
      // Xử lý lỗi ở đây
      print('Lỗi khi lấy tất cả tasks: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }

  // Cập nhật Task
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
      // Xử lý lỗi ở đây
      print('Lỗi khi update task: $e');
      return -1;
    }
  }

  // Xóa Task
  Future<int> deleteTask(int id) async {
    final db = await database;
    try {
      return await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // Xử lý lỗi ở đây
      print('Lỗi khi delete task: $e');
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
    }
  }
}