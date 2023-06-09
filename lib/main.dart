import 'package:arquivo_morto/screens/Arquivo.dart';
import 'package:arquivo_morto/screens/cadastrar.dart';
import 'package:arquivo_morto/screens/login.dart';
import 'package:arquivo_morto/services/arquivo_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arquivo Morto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

