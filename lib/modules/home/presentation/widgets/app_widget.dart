import 'package:flutter/material.dart';
// Importa a biblioteca de widgets do Flutter, que fornece os componentes de UI.

import 'package:flutter_modular/flutter_modular.dart';
// Importa o pacote Flutter Modular para modularização do aplicativo

class AppWidget extends StatelessWidget {
  // Define a classe `AppWidget` que estende `StatelessWidget`

  @override
  Widget build(BuildContext context) {
    // O método `build` constrói a interface de usuário para este widget

    return MaterialApp.router(
      // `MaterialApp.router` é uma versão especial de `MaterialApp` que suporta o sistema de roteamento avançado do Flutter Modular

      title: 'BuscaCEP',
      // Define o título do aplicativo

      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Define o tema do aplicativo na cor azul
      ),

      routeInformationParser: Modular.routeInformationParser,
      // Especifica o parser de informações de rota do Flutter Modular, que é responsável por interpretar e construir rotas

      routerDelegate: Modular.routerDelegate,
      // Especifica o delegate de roteamento do Flutter Modular, que controla o estado da navegação e gerencia as transições de página
    );
  }
}
