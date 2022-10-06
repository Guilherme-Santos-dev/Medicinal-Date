import 'dart:convert';
class Medicine{
  String nome;
  String observacao;
  String quantidade;
  String horario;
  

  Medicine({
    required this.nome,
    required this.observacao,
    required this.quantidade,
    required this.horario,
  });

  Map<String, dynamic> toMap(){
  return <String, dynamic>{
    'nome': nome,
    'observacao': observacao,
    'quantidade': quantidade,
    'horario': horario,

  };
  }

  factory Medicine.fromMap(Map<String, dynamic> map){
    return Medicine(
      nome: map['nome'],
      observacao: map['observacao'],
      quantidade:  map['quantidade'],
      horario: map['horario'],
      );
  }
}