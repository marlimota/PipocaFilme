import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  Widget _body() {
    return Container(
      child: SizedBox(
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                    'https://cdn4.iconfinder.com/data/icons/planner-color/64/popcorn-movie-time-512.png'),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 1, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (text) {
                            email = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (text) {
                            senha = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                              focusColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (email == 'marli@mota.com' && senha == '123') {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    print('Login Inválido!');
                  }
                },
                child: Container(
                  child: Text('Entrar',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red[400]),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://images.clipartlogo.com/files/istock/previews/9726/97261661-heap-popcorn-for-movie-lies-on-blue-background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
              //color: Colors.black.withOpacity(-0.1),
              ),
          _body(),
        ],
      ),
    );
  }
}
