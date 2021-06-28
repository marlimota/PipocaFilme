import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  Widget _body() {
    return ListView(
      children: [
        Stack(
        children: [
          Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 42, right: 42, top: 330, bottom: 0),
            child: 
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color.fromARGB(240, 243,237,237)),
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
          Padding(
          padding: const EdgeInsets.only(left: 52, right: 52, top: 102, bottom: 0),
          child: Container(
            child: Image.asset('assets/images/ClipartKey_53820.png'),
          ),
        ),
        ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
          child: ElevatedButton(
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
            style: ElevatedButton.styleFrom(primary: Colors.amberAccent[400]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/TelaDeLogin.png"),
                fit: BoxFit.cover,
              ),
            ),
            // height: MediaQuery.of(context).size.height,
            // child: Image.asset('assets/images/TelaDeLogin.png'),
            //fit: BoxFit.cover,
          ),
          _body(),
        ],
      ),
    );
  }
}
