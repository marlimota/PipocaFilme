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
    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: ClipOval(
            child: Image.asset('assets/images/foto1.jpg'),
          ),
          accountName: Text('Marli Mota'),
          accountEmail: Text('marli@mota.com'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Inicio'),
          subtitle: Text('Página inicial'),
          onTap: () {
            print('Home');
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Favoritos'),
          subtitle: Text('Filmes salvos'),
          onTap: () {
            print('Home');
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sair'),
          subtitle: Text('Encerrar sessão'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        )
      ],
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
