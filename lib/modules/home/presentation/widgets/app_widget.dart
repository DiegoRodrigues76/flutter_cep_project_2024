import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Classe principal do widget do aplicativo
class AppWidget extends StatelessWidget {
  // Construtor da classe AppWidget
  const AppWidget({super.key});

  // Método que constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Título do aplicativo
      title: 'BuscaCEP',
      // Remove a bandeira de depuração do aplicativo
      debugShowCheckedModeBanner: false,
      // Define o tema do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define o analisador de informações de rota do Modular
      routeInformationParser: Modular.routeInformationParser,
      // Define o delegado de rotas do Modular
      routerDelegate: Modular.routerDelegate,
    );
  }
}
