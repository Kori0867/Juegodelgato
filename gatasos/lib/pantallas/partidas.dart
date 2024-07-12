import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/db.dart';

class Partidas extends StatelessWidget {
  const Partidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Partidas anteriores"),
      ),
      body: FutureBuilder(
        future: DB.consulta(),
        builder: (context, db) {
          if (db.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final partidas = db.data!;
            return ListView.builder(
              itemCount: partidas.length,
              itemBuilder: (context, index) {
                final partida = partidas[index];
                return ListTile(
                  title: Text("Partida #${partida.id}"),
                  subtitle: Text(
                      "Circulos: ${partida.circulo}, Cruz: ${partida.cruz}, Empates: ${partida.empate}, Fecha: ${partida.createdAt}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
