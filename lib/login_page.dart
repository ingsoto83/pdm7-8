
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdm7/list_widget.dart';



class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool visibility = false;
  bool loading = false;
  String user ="";
  String pass ="";

  @override
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(_auth.currentUser!=null){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) {
                return const ListWidget();
              }
          ), (route) => false);
    }
  }

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
                          validator: (value)=> value!.isEmpty ? "Escribe tu usuario...!" : null,
                          onSaved: (value)=> user = value??'',
                          decoration: const InputDecoration(
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
                          validator: (value){
                            if(value!.isEmpty){
                              return "Escribe tu contraseña...!";
                            }else if(value.length < 6){
                              return "Debe ser de al menos 6 caracteres...!";
                            }else{
                              return null;
                            }
                          },
                          onSaved: (value)=> pass = value??'',
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              login();
                            }
                          },
                          child: loading ? Row(children: [CircularProgressIndicator(), SizedBox(width: 10,), Text("Cargando...")],) : Text("Iniciar Sesión")
                        )
                      )
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
   setState(() {
     loading=true;
   });
   try{
    await _auth.signInWithEmailAndPassword(email: user, password: pass);
   }catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       backgroundColor: Colors.red,
       duration: Duration(seconds: 4),
       content: Row(
         children: [
           Icon(Icons.dangerous, color: Colors.white),
           SizedBox(width: 16,),
           Expanded(
             child: Text(e.toString()),
           )
         ],
       ),
     ));
   }finally{
     setState(() {
       loading=false;
     });
     if(_auth.currentUser!=null){
       /* Si unicamente hemos abierto un solo widget
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
               builder:(context)=>ListWidget(),
           )
       );*/
       Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(
               builder: (context) {
                 return const ListWidget();
               }
           ), (route) => false);
     }
   }
  }
}
