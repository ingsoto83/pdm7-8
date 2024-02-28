import 'package:flutter/material.dart';

class BasicWidgets extends StatelessWidget {
  const BasicWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Widgets Básicos"),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text("Bienvenidos", style: TextStyle(fontSize: 25),),
          Text("a su primer",style: TextStyle(fontSize: 25),),
          Text("unidad", style: TextStyle(fontSize: 25),),
          Text("reprobada", style: TextStyle(fontSize: 25),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.star, color: Colors.amber,),
            Icon(Icons.star, color: Colors.amber,),
            Icon(Icons.star, color: Colors.amber,),
            Icon(Icons.star, color: Colors.amber,),
            Icon(Icons.star, color: Colors.amber,),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text("Save"),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text("Send"),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
