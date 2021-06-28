import 'package:filmes_app/features/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'features/presentation/pages/home_page.dart';
import 'features/presentation/pages/login_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'PipocaFilme',
          theme: ThemeData(
            primaryColor: Colors.red[900],
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/details': (context) => DetailsPage(),
          },
        );
  }
}
