import 'package:flutter/material.dart';
import 'package:scireclass/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String perfil = 'ALUNO'; // Defina o perfil padrão
  String nome = '';
  String senha = '';
  String email = '';
  String cep = '';
  String numero = '';
  bool aceitouTermos = false;
  bool modalOKVisible = false;
  bool modalBADVisible = false;
  bool modalLoadingVisible = false;

  void handleCadastraUsuario() {
    // Lógica para lidar com o cadastro do usuário
  }

  void checkCEP() {
    // Lógica para verificar o CEP
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
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        cep = value;
                      });
                    },
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
}

void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}
