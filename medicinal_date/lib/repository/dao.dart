import 'package:sqflite/sqflite.dart';

class DAO{
  static final dbNome = "user.db";

  static Future<Database> getConnection() async {
    String DatabasePath = "${getDatabasesPath()} $dbNome";
    Database db = await openDatabase(
      DatabasePath,
      version: 1,
      onCreate: (db, _) async {
        await db.execute(
          "CREATE TABLE medicine(id INTEGER primary key AUTOINCREMENT, nome TEXT, obs TEXT, quantidade INTEGER, horario TEXT, isFavorite INTEGER);" );
        
        
      }
    );
  }
}