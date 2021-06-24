import 'dart:ui';

import 'package:filmes_app/features/presentation/pages/home_page.dart';
import 'package:filmes_app/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:filmes_app/app_controller.dart';

//botão de mudança de temas
class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: AppController.instance.isDartTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        },
      ),
    );
  }
}

//Barra(menu) lateral
class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bc_home_dd.png"),
            fit: BoxFit.cover,
          ),
        ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: Image.asset('assets/images/foto1.jpg'),
            ),
            accountName: Text('Marli Mota'),
            accountEmail: Text('marli@mota.com'),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.red),
            title: Text('Inicio', style: TextStyle(color: Colors.red),),
            subtitle: Text('Página inicial'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.red),
            title: Text('Favoritos', style: TextStyle(color: Colors.red),),
            subtitle: Text('Filmes salvos'),
            onTap: () {
              print('Home');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text('Sair', style: TextStyle(color: Colors.red),),
            subtitle: Text('Encerrar sessão'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    );
  }
}

//Barra (menu) superior
// class AppBarHome extends PreferredSize {
//   //@override
//   AppBarHome()
//       : super(
//           title: Text('PipocaFilme'),
//           actions: [
//             CustomSwitch(),
//           ],
//         );
// }
