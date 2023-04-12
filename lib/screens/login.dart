import 'package:arquivo_morto/screens/my_home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tela de Login',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                    width: 400,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'E-mail'),
                    )),
                Container(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Digite sua senha'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 70,
                      height: 17,
                      child: Row(
                        children: [
                          Text(style: TextStyle(fontSize: 15), 'Entrar'),
                          Icon(Icons.input),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
