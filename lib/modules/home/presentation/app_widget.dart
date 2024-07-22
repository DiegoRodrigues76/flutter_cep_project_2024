import 'package:flutter/material.dart'; // Importa o pacote Flutter para construir a interface do usuário
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para navegação e modularização

// Define um widget sem estado chamado AppWidget
class AppWidget extends StatelessWidget {
  // Construtor do AppWidget com uma chave opcional
  const AppWidget({super.key});

  // Sobrescreve o método build para construir a interface do usuário
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BuscaCEP', // Define o título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a paleta de cores primária do aplicativo
      ),
      routeInformationParser: Modular.routeInformationParser, // Configura o parser de informações de rota do Modular
      routerDelegate: Modular.routerDelegate, // Configura o delegate de rotas do Modular
    );
  }
}
