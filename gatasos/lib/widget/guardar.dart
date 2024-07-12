

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guardar{
  bool checar = false;
  Future<void> guardando (BuildContext context) async{
    await showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(shape: RoundedRectangleBorder(),
        content: Card(
          child: Column(
            children: [
              Text("Deseas Guardar?"),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                this.checar = true;
                Navigator.of(context).pop();
              }, child: Text("SI")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                this.checar = false;
                Navigator.of(context).pop();
              }, child: Text("NO")),
            ],
          ),
        ),);
    }

    );

  }
}