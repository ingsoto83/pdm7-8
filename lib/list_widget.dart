import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas en Flutter"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/72.jpg")),
              title: Text("Alejandro Soto"),
              subtitle: Text("Desarrollador de aplicaciones móviles y aplicaciones web", maxLines: 1, overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/83.jpg")),
              title: Text("Fulano Pérez"),
              subtitle: Text("Arquitecto"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/28.jpg")),
              title: Text("Ximena Zavala"),
              subtitle: Text("Psicologa"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/76.jpg")),
              title: Text("Maricela Medrano"),
              subtitle: Text("Deportista"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}
