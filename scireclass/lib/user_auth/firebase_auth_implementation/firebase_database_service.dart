import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scireclass/endereco.dart';
import 'package:scireclass/user.dart';

class FireBaseDatabaseService {
  bool saveUser(UserModel userModel, EnderecoModel enderecoModel) {
    try {
      final userCollection = FirebaseFirestore.instance.collection("users");

      String id = userCollection.doc().id;

      final newUser = UserModel(
              perfil: userModel.perfil,
              nome: userModel.nome,
              senha: userModel.senha,
              email: userModel.email,
              cep: userModel.cep,
              numero: userModel.numero,
              id: id)
          .toJson();

      userCollection.doc(id).set(newUser);

      saveEndereco(enderecoModel);

      return true;
    } catch (e) {
      return false;
    }
  }

  bool saveEndereco(EnderecoModel enderecoModel) {
    try {
      final enderecoCollection =
          FirebaseFirestore.instance.collection("endereco");

      String id = enderecoCollection.doc().id;

      final newEndereco = EnderecoModel(
              numero: enderecoModel.numero,
              cep: enderecoModel.cep,
              logradouro: enderecoModel.logradouro,
              complemento: enderecoModel.complemento,
              bairro: enderecoModel.bairro,
              localidade: enderecoModel.localidade,
              uf: enderecoModel.uf,
              id: id)
          .toJson();

      enderecoCollection.doc(id).set(newEndereco);
      return true;
    } catch (e) {
      return false;
    }
  }
}
