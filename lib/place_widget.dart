import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  PlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget imageSection = Image.asset('assets/img/place.jpeg', height: height * .30, width:width , fit: BoxFit.cover);
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("Playa de Cancún", style: TextStyle(fontWeight: FontWeight.bold))
                ),
                Text("Quintana Roo, México", style: TextStyle(color: Colors.grey[500]),)
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.amber,),
          Text("41")
        ],
      ),
    );
    Widget buttonsSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColumn("CALL", Icons.call, Colors.blue),
        _buildColumn("ROUTE", Icons.near_me, Colors.blue),
        _buildColumn("SHARE", Icons.share, Colors.blue),
      ],
    );
    return Scaffold(
      body: Column(
        children: [
          imageSection,
          titleSection,
          buttonsSection
        ],
      ),
    );
  }

  Column _buildColumn(String title, IconData icon, Color color){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(title, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w400),),
        )
      ],
    );
  }
}

