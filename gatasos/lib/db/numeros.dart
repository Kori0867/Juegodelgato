

class Numeros{
  int? id;
  int? circulo;
  int? cruz;
  int? empate;
  String? createdAt;


  Numeros( this.circulo, this.cruz, this.empate);

  Numeros.frontMap(Map<String, dynamic> mapa){
    id = mapa["id"];
    circulo = mapa["circulos"];
    cruz = mapa["cruz"];
    empate = mapa["empate"];
    createdAt = mapa["createdAt"];
  }

  Map<String, dynamic> mapeador(){
    return{
      "id":id,
      "circulos":circulo,
      "cruz":cruz,
      "empate":empate,
      "createdAt":createdAt
    };
  }
}