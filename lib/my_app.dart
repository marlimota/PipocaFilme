import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'login_page.dart';
import 'app_controller.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'PipocaFilme',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/home',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage()
          },
        );
      },
    );
  }
}
