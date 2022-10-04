import 'package:sqflite/sqflite.dart';


class DAO {
  static Future<Database> getConnection() async {
    const dbNome = "medicinedb.db";
    final dbPath = getDatabasesPath();
    final path = "$dbPath $dbNome";

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        const sql =
            "CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT, observacao TEXT, quantidade INTEGER, horario TEXT)";
        await db.execute(sql);
      },
    );
    return db;
  }
}






/*
class DAO{
  static final dbNome = "user.db";

  static Future<Database> getConnection() async {
    String DatabasePath = "${getDatabasesPath()} $dbNome";
    Database db = await openDatabase(
      DatabasePath,
      version: 1,
      onCreate: (db, _) async {
        await db.execute(
          "CREATE TABLE medicine(id INTEGER primary key AUTOINCREMENT, nome TEXT, observacao TEXT, quantidade INTEGER, horario TEXT, isFavorite INTEGER);" );
        
        
      }
    );
    return db;
  }
}
*/