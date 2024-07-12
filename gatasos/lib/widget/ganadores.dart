

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../db/db.dart';
import '../db/numeros.dart';
import 'guardar.dart';

class Ganadores {

  void elGanador <Widget>(BuildContext context, String ganador, Function resetBoard, int circulo, int cruz, int empate){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(shape: RoundedRectangleBorder(),
      content: Card(
        child: Column(
          children: [Text("JUEGO TERMINADO"),
          SizedBox(height: 10,),
          Text("El ganador es: $ganador"),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            resetBoard();
            Navigator.of(context).pop();
          }, child: Text("Nuevo Juego")),
          SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              Guardar guardando = Guardar();
              await guardando.guardando(context);
              bool algo3 = guardando.checar;
              if(algo3) {
                Numeros res = Numeros(circulo, cruz, empate);
                DB db = DB();
               await db.insertar(res);

              }
              exit(0);
              }, child: Text("Salir"))
          ],
        ),
      ),
      );
    });
  }
}