import 'dart:convert';
class Medicine{
  String nome;
  String obscervacao;
  String quantidade;
  String horario;
  

  Medicine({
    required this.nome,
    required this.obscervacao,
    required this.quantidade,
    required this.horario,
  });

  Map<String, dynamic> toMap(){
  return <String, dynamic>{
    'nome': nome,
    'obscervacao': obscervacao,
    'quantidade': quantidade,
    'horario': horario,

  };
  }

  factory Medicine.fromMap(Map<String, dynamic> map){
    return Medicine(
      nome: map['nome'],
      obscervacao: map['observacao'],
      quantidade:  map['quantidade'],
      horario: map['horario'],
      );
  }
}