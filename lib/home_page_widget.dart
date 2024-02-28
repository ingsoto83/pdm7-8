import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int count =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          setState(() {

          });
          print(count);
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Presionaste el botón ${count} veces", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
