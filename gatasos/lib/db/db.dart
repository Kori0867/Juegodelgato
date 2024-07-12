import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart';

import 'numeros.dart';

class DB{
  static Future<sqlite.Database> db() async{
    String ruta = await sqlite.getDatabasesPath();
    String rutaa = join(ruta,"resultado.db");
    debugPrint(rutaa);
    return sqlite.openDatabase(rutaa,
      version: 1, singleInstance: true, onCreate: (sqlite.Database db, int version) async{
        await create(db);
        }
    );
  }

  static Future<void> create(sqlite.Database db) async{
    const String sql = """
    CREATE TABLE puntuacion(
    id integer primary key autoincrement not null,
    circulos int,
    cruz int,
    empate int,
    createdAt timestamp not null default CURRENT_TIMESTAMP
    )
    """;
    await db.execute(sql);
  }


  static Future<List<Numeros>> consulta() async {

    final sqlite.Database db = await DB.db();

    final List<Map<String, dynamic>> query = await db.query("puntuacion");

    List<Numeros> ? resultado = query.map((e){
      return Numeros.frontMap(e);
    }).toList();

    return resultado;
  }

   Future<int> insertar(Numeros resultado) async {
    int value = 0;
    final sqlite.Database db = await DB.db();
    debugPrint("Insertando...");
    value = await db.insert("puntuacion", resultado.mapeador(), conflictAlgorithm: sqlite.ConflictAlgorithm.replace);



    return value;
  }
}

