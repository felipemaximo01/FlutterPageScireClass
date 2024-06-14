import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? perfil;
  final String? nome;
  final String? senha;
  final String? email;
  final String? cep;
  final String? numero;
  final String? id;

  UserModel(
      {this.perfil,
      this.nome,
      this.senha,
      this.email,
      this.cep,
      this.numero,
      this.id});

  static UserModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
        perfil: snapshot['perfil'],
        nome: snapshot['nome'],
        senha: snapshot['senha'],
        email: snapshot['email'],
        cep: snapshot['cep'],
        numero: snapshot['numero'],
        id: snapshot['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "perfil": perfil,
      "nome": nome,
      "senha": senha,
      "email": email,
      "cep": cep,
      "numero": numero,
      "id": id,
    };
  }
}
