import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;

  @override
  void initState() {
    super.initState();
    usuario = _auth.currentUser;
    print(usuario);
  }
  @override
  Widget build(BuildContext context) {
    _auth.signOut();
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body:Center(
        child: Text(usuario==null ? "No hay usuario logeado" : "Usuario conectado : ${usuario!.email}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          UserCredential result = await _auth.signInWithEmailAndPassword(email: 'soto@its.mx', password: 'soto123');
          usuario = result.user;
          setState(() {

          });
          print(result);
          },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.login, color: Colors.white,),
      ),
    );
  }
}
