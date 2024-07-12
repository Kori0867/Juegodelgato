

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seguro {

  bool checar = false;
  Future<void> asegurar (BuildContext context) async {
      await showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(shape: RoundedRectangleBorder(),
      content: Card(
        child: Column(
          children: [
            Text("SEGURO?"),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              this.checar = true;

              Navigator.of(context).pop();
            }, child: Text("Aceptar")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              this.checar = false;
              Navigator.of(context).pop();
            }, child: Text("Cancelar")),
          ],
        ),
      ),);
    }

    );

  }
}