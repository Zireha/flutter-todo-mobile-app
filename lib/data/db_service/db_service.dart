import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/model/todo.dart';

class DBService {
  static final DBService instance = DBService._instance();
  static Database? _database;

  DBService._instance();

  Future<Database> get db async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'todo.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todo 
    (
      id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT,
      end_date TEXT,
      end_time TEXT,
      priority INTEGER,
      completed INTEGER
    )
    ''');
  }

  Future<int> insertData(Todo todo) async {
    Database db = await instance.db;
    return await db.insert('todo', todo.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.db;
    return await db.query('todo');
  }

  Future<int> updateData(Todo todo) async {
    Database db = await instance.db;
    return await db.update('todo', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteData(int id) async {
    Database db = await instance.db;
    return await db.delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> initializeTask() async {
    List<Todo> taskToAdd = [
      Todo(id: 1, taskTitle: "Masak Aer", taskDescription: "Biar Mateng", endDate: "10-12-2024", endTime: "16:00", priority: 1, isCompleted: false ? 1 : 0),
      Todo(id: 2, taskTitle: "Belanja Makan", taskDescription: "Belanja jajan", endDate: "11-12-2024", endTime: "12:00", priority: 3, isCompleted: true ? 1 : 0),
      Todo(id: 3, taskTitle: "Tugas Kuliah", taskDescription: "Kerjain PR", endDate: "13-12-2024", endTime: "11:00", priority: 1, isCompleted: false ? 1 : 0),
      Todo(id: 4, taskTitle: "Nyantai", taskDescription: "Gada sih hehe", endDate: "14-12-2024", endTime: "08:00", priority: 1, isCompleted: true ? 1 : 0),
    ];

    for(Todo todo in taskToAdd) {
      await insertData(todo);
    }
  }
}