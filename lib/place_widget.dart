import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  PlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget imageSection = Image.asset('assets/img/place.jpeg', height: height * .30, width:width , fit: BoxFit.cover);
    Widget imageSectionLandscape = Image.asset('assets/img/place.jpeg', height: height , width:width * 0.45 , fit: BoxFit.cover);
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
    Widget descriptionSection = Padding(
      padding: EdgeInsets.all(32),
      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lectus quam, commodo non felis id, gravida euismod odio. Morbi arcu felis, maximus nec ex accumsan, luctus facilisis diam. Nunc ullamcorper augue id magna dictum, eget pellentesque orci accumsan. Morbi est turpis, suscipit ut luctus eu, convallis sit amet neque. Sed auctor risus felis, vel dignissim nisl vestibulum quis. Mauris mauris ante, gravida eget arcu ac, tincidunt finibus enim. Vestibulum ac lacus nunc. In vestibulum dignissim augue, in venenatis elit tincidunt ut. Nam nunc diam, laoreet eu tortor id, hendrerit varius neque. Vestibulum suscipit mi lobortis porttitor tristique. Nulla egestas pretium venenatis. Phasellus quis enim orci."
          "Vivamus vitae mauris suscipit, fermentum dui vitae, venenatis est. Cras faucibus interdum metus vel pellentesque. Vivamus ut semper purus, a auctor sapien. Fusce eget felis tellus. Curabitur ornare interdum arcu, quis tempor tortor. Proin dapibus turpis ac libero aliquet, at ornare nunc porttitor. Pellentesque dui mauris, volutpat molestie commodo sit amet, pulvinar eget ipsum. Aenean tristique, orci eget pellentesque sagittis, justo elit congue eros, nec consectetur nisi ante eu nisi. In egestas varius odio, ac vestibulum lectus tincidunt quis."
          "Sed ut ultricies libero. Praesent semper libero neque, sed convallis tellus molestie vel. Maecenas aliquet ipsum vel felis varius, at convallis nunc pharetra. Quisque in ornare est, non condimentum turpis. Phasellus eu pellentesque leo. Maecenas sagittis, orci at suscipit gravida, ex dolor pellentesque nulla, in mollis nunc tellus sed ligula. Mauris sodales quam in nunc consectetur, et scelerisque libero dictum. Maecenas dui nibh, sagittis ut velit eu, accumsan vulputate ante. Donec mollis orci ante, non congue ante suscipit sed. Donec vitae magna sem. Quisque vel pretium enim.",
       textAlign: TextAlign.justify,
      ),
    );
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation==Orientation.portrait ? SingleChildScrollView(
            child: Column(
              children: [
                imageSection,
                titleSection,
                buttonsSection,
                descriptionSection
              ],
            ),
          ) : 
          Row(
            children: [
              imageSectionLandscape,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      titleSection,
                      buttonsSection,
                      SafeArea(child:descriptionSection) //SafeArea evita colisionar con notchs
                    ],
                  ),
                ),
              )
            ],
          );
        }
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

