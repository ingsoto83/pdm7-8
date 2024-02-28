import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/img/gatos.jpeg'),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 5),
                image: DecorationImage(
                  image: AssetImage('assets/img/gatos.jpeg'),fit: BoxFit.cover
                )
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.amber,
              child: Center(
                child: Text(
                    "Fight!!!",
                    style: TextStyle(fontSize: 80, fontFamily: 'Signatra', color: Colors.black45)
                ),
              )
          ),
        ],
      ),
    );
  }
}
