import 'dart:io';

class User{
  String nome;
  String email;
  double celular;
  String usuario;
  String senha;
  bool jaAcessei;
  File imagem;

  User({ 
    required this.nome,
    required this.email,
    required this.celular,
    required this.usuario,
    required this.senha,
    required this.jaAcessei,
    required this.imagem
  });

}