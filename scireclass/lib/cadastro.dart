import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scireclass/endereco.dart';
import 'package:scireclass/login.dart';
import 'package:scireclass/toast.dart';
import 'package:scireclass/user.dart';
import 'package:scireclass/user_auth/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:scireclass/user_auth/firebase_auth_implementation/firebase_database_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _cepController = TextEditingController();

  final FirebaseAuthService _authService = FirebaseAuthService();

  final FireBaseDatabaseService _databaseService = FireBaseDatabaseService();

  String perfil = 'ALUNO';
  String nome = '';
  String senha = '';
  String email = '';

  bool aceitouTermos = false;

  String cep = '';
  String numero = '';
  String logradouro = '';
  String bairro = '';
  String localidade = '';
  String uf = '';

  void checkCEP() {
    String enteredCep = _cepController.text.replaceAll('-', '');
    if (enteredCep.length == 8) {
      String url = 'https://viacep.com.br/ws/$enteredCep/json/';
      http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          if (!data.containsKey('erro')) {
            setState(() {
              logradouro = data['logradouro'];
              bairro = data['bairro'];
              localidade = data['localidade'];
              uf = data['uf'];
            });
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('CEP Inválido'),
                  content: Text(
                      'CEP inválido. Por favor, verifique o CEP inserido.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _cepController.clear();
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else {
          throw Exception('Failed to load data');
        }
      }).catchError((error) {
        print(error);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text(
                  'Ocorreu um erro ao buscar o CEP. Tente novamente mais tarde.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('CEP Inválido'),
            content: Text('CEP inválido. Por favor, verifique o CEP inserido.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _cepController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1000,
              color: Color(0xFFF0F0F2),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 30,
                      color: Color(0xFF1F1F39),
                    ),
                  ),
                  Text(
                    'Insira seus dados abaixo e cadastre-se gratuitamente',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 12,
                      color: Color(0xFFB8B8D2),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tipo Usuário',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'PROFESSOR',
                        groupValue: perfil,
                        onChanged: (value) {
                          setState(() {
                            perfil = value!;
                          });
                        },
                      ),
                      Text(
                        'Professor',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                      Radio(
                        value: 'ALUNO',
                        groupValue: perfil,
                        onChanged: (value) {
                          setState(() {
                            perfil = value!;
                          });
                        },
                      ),
                      Text(
                        'Aluno',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Nome',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Senha',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        senha = value;
                      });
                    },
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Seu Email',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'CEP',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  TextField(
                    controller: _cepController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        cep = value;
                      });
                    },
                    onEditingComplete: checkCEP,
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'N° residencial',
                    style: TextStyle(
                      color: Color(0xFF858597),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        numero = value;
                      });
                    },
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: aceitouTermos,
                        onChanged: (value) {
                          setState(() {
                            aceitouTermos = value!;
                          });
                        },
                      ),
                      Text(
                        'concordar com nossos termos e condição.',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          color: Color(0xFF858597),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Já tem uma conta? ',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Color(0xFF858597),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Color(0xFF3D5CFF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleCadastraUsuario,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3D5CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleCadastraUsuario() async {
    UserModel userModel = UserModel(
      perfil: perfil,
      nome: nome,
      senha: senha,
      email: email,
      cep: cep,
      numero: numero,
    );

    EnderecoModel enderecoModel = EnderecoModel(
        numero: numero,
        cep: cep,
        logradouro: logradouro,
        bairro: bairro,
        localidade: localidade,
        uf: uf);

    bool salvouUser = _databaseService.saveUser(userModel, enderecoModel);
    if (salvouUser) {
      User? user = await _authService.signUpWithEmailAndPassword(email, senha);
      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        showToast(message: "Cadastro realizado com sucesso");
      } else {
        showToast(message: "Erro Ao Realizar o cadastro");
      }
    } else {
      showToast(message: "Erro Ao Realizar o cadastro");
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}
