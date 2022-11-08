import 'package:flutter/material.dart';
import 'package:vita_health/view/register_page_component.dart';

import '../models/user_model.dart';

class TelaPrincipal extends StatelessWidget {
  // List<User> listUser = [];
  User user;
  TelaPrincipal(this.user);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children:  [
            UserAccountsDrawerHeader(
              arrowColor: Colors.red,
              currentAccountPicture: 
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage( fit: BoxFit.fitWidth, image: FileImage(user.imagem))
                  ),
                ),
              ),
              accountName: Text(user.usuario), 
              accountEmail: Text(user.email),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ListTile(
                onTap: (){
                  // print('object');
                } ,
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
            ),
            ListTile(
              onTap: (){
                // print('object');
              },
              leading: Icon(Icons.emoji_people),
              title: Text('Exercícios'),
              
            ),
            ListTile(
              onTap: (){
                // print('object');
              },
              leading: Icon(Icons.money),
              title: Text('Wscoin'),
              
            ),
            ListTile(
              onTap: (){
                // print('object');
              },
              leading: Icon(Icons.shopping_cart),
              title: Text('Loja'),
              
            ),
            ListTile(
              onTap: (){
                // print('object');
              },
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              
            ),
            ListTile(
              onTap: (){
                // print('object');
                Navigator.of(context).pushReplacementNamed('/login');
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              
            ),
          ],
        ),
        
      ),  
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const[
                Text('Vita Health', style: TextStyle(fontSize: 20),),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  // style: TextStyle(fontSize: 18)
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//         itemCount: usersList.length,
//         itemBuilder: (context, index) {
//           return Center(
//             child: Column(
//               children: [
//                 Text('${usersList[index].nome}'),
//                 Text('${usersList[index].email}'),
//                 Text('${usersList[index].celular}'),
//                 Text('${usersList[index].senha}'),

                
//               ],
//             ),
//           );
//         },
//       ),

