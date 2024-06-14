import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scireclass/cadastro.dart';
import 'package:scireclass/homepage.dart';
import 'package:scireclass/toast.dart';
import 'package:scireclass/user_auth/firebase_auth_implementation/firebase_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1000,
              color: Color(0xFFF0F0F2),
              padding: EdgeInsets.all(16),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 30,
                  color: Color(0xFF1F1F39),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  GestureDetector(
                    onTap: () {
                      // Lógica para lidar com o esqueceu a senha
                    },
                    child: Text(
                      'Esqueceu a senha ?',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Color(0xFF858597),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleLoginUsuario,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3D5CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Não tem uma conta? ',
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
                              builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Color(0xFF3D5CFF),
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

  void handleLoginUsuario() async {
    User? user = await _authService.singInWithEmailAndPassword(email, senha);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      showToast(message: "Login Realizado Com Sucesso");
    } else {
      showToast(message: "Erro Ao Realizar o Login");
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}
