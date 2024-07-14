import 'package:flutter/material.dart';  // Biblioteca de widgets de design material do Flutter
import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para gerenciamento de módulos

// Importando os módulos personalizados do aplicativo
import 'modules/app_module.dart';  // Importa o módulo principal do aplicativo (AppModule)
import 'modules/home/presentation/app_widget.dart';  // Importa o widget principal do aplicativo (AppWidget)

// Função principal, ponto de entrada da aplicação
void main() {
  // Inicia a aplicação Flutter com o widget ModularApp
  runApp(
    ModularApp(
      module: AppModule(),  // Define o módulo principal da aplicação como AppModule
      child: const AppWidget(),  // Define o widget raiz da aplicação como AppWidget
    ),
  );
}
