import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'bookmarks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bookmarks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT UNIQUE,
            language TEXT,
            rating REAL,
            image TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(
      'bookmarks',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getBookmarks() async {
    Database db = await database;
    return await db.query('bookmarks');
  }

  static Future<int> delete(String title) async {
    Database db = await database;
    return await db.delete(
      'bookmarks',
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}
