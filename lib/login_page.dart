
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/place.jpeg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.purple.withOpacity(0.30),
                    Colors.black45
                  ])),
              child: const Center(
                  child: Text(
                "TravelApp",
                style: TextStyle(
                    fontFamily: 'Signatra', fontSize: 80, color: Colors.white),
              )),
            ),
            Positioned(
              top:220,
              child: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(62),
                    topRight: Radius.circular(62),
                  )
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.purple,),
                            labelText: "Usuario",
                            labelStyle: TextStyle(color: Colors.purple),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                              gapPadding: 10
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                              gapPadding: 10
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          obscureText: visibility ? false : true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.purple,),
                            suffixIcon: GestureDetector(
                                onTap:() {
                                  visibility = ! visibility;
                                  setState(() {

                                  });
                                },
                                child: Icon(visibility ? Icons.visibility_off : Icons.visibility)),
                            labelText: "Contraseña",
                            labelStyle: TextStyle(color: Colors.purple),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                              gapPadding: 10
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                              gapPadding: 10
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  logout() async {
    await _auth.signOut();
    setState(() {});
  }

  login() async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: 'soto@its.mx', password: 'soto123');
    setState(() {});
    print(result);
  }
}
