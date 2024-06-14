import 'package:cloud_firestore/cloud_firestore.dart';

class EnderecoModel {
  final String? numero;
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? id;

  EnderecoModel(
      {this.numero,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.id});

  static EnderecoModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EnderecoModel(
        numero: snapshot['numero'],
        cep: snapshot['cep'],
        logradouro: snapshot['logradouro'],
        complemento: snapshot['complemento'],
        bairro: snapshot['bairro'],
        localidade: snapshot['localidade'],
        uf: snapshot['uf'],
        id: snapshot['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "numero": numero,
      "cep": cep,
      "logradouro": logradouro,
      "complemento": complemento,
      "bairro": bairro,
      "localidade": localidade,
      "uf": uf,
      "id": id,
    };
  }
}
