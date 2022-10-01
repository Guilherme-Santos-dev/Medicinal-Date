import 'dart:convert';
class Medicine{
  int? id;
  String nome;
  String obscervacao;
  String quantidade;
  String horario;
  bool isFavorite;

  Medicine({
    this.id,
    required this.nome,
    required this.obscervacao,
    required this.quantidade,
    required this.horario,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap(){
  return <String, dynamic>{
    'id': id,
    'nome': nome,
    'obscervacao': obscervacao,
    'quantidade': quantidade,
    'horario': horario,
    'isFavorite': isFavorite,

  };
  }
}