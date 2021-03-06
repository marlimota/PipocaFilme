import 'package:flutter/material.dart';
import 'features/presentation/pages/home_page.dart';
import 'features/presentation/pages/login_page.dart';
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
            primaryColor: Colors.pinkAccent[700],
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
        );
      },
    );
  }
}
