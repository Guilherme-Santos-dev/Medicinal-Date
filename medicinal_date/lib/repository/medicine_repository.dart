import 'package:flutter/cupertino.dart';
import 'package:medicinal_date/model/Medicine.dart';
import 'package:medicinal_date/repository/dao.dart';
import 'package:sqflite/sqflite.dart';

class MedicineRepository{
  static var _table = "medicine";
  static Future<int> insertMedicine(Map<String, dynamic> data) async{
    Database db = await DAO.getConnection();
    int result = await db.insert(_table, data);
    return result;
  }

  static Future<List<Medicine>> findALL() async{
    Database db = await DAO.getConnection();
    final elements = await db.query(_table);
    return elements.map((mapa) => Medicine.fromMap(mapa)).toList();
  }

  static Future<int> updateMedicine(Medicine medicine) async {
    final db = await DAO.getConnection();
    return await db.update(_table, medicine.toMap(), where: "id=?", whereArgs: [medicine.id],);
  }
}