import 'package:flutter/material.dart';  // Biblioteca Flutter para construção de UIs
import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para gerenciamento de rotas

// Classe AppWidget: Define o widget principal do aplicativo
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});  // Construtor da classe AppWidget

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BuscaCEP',  // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define a cor principal do tema como azul
      ),
      routeInformationParser: Modular.routeInformationParser,  // Define o parser de informações de rota do Flutter Modular
      routerDelegate: Modular.routerDelegate,  // Define o delegado de roteamento do Flutter Modular
    );
  }
}
