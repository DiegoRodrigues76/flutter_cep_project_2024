import 'package:flutter/material.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';

// Definição da classe HomePage que estende StatelessWidget
class HomePage extends StatelessWidget {
  // Construtor da classe HomePage
  HomePage({super.key});

  // Instâncias de GlobalWidgets e ThemeColors
  final GlobalWidgets widgets = GlobalWidgets();
  final ThemeColors themeColors = ThemeColors();

  // Método build que constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea garante que o conteúdo da tela não se sobreponha às áreas seguras do dispositivo
      child: Scaffold(
        // Scaffold fornece a estrutura básica para a interface do aplicativo
        backgroundColor: themeColors.white,
        body: Container(
          // Container principal com largura máxima
          width: double.maxFinite,
          // Padding interno do Container
          padding: const EdgeInsets.only(
            left: 32,
            top: 62,
            right: 32,
          ),
          child: Column(
            // Column organiza os widgets verticalmente
            children: [
              Text(
                "Consultor de CEP e Endereços",
                style: widgets.titleStyle, // Estilo do título definido em GlobalWidgets
              ),
              const SizedBox(height: 14), // Espaçamento entre widgets
              Container(
                // Container para o botão "Buscar por CEP"
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Buscar por CEP",
                  iconData: Icons.location_on,
                  route: '/busca_cep',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 14), // Espaçamento entre widgets
              Container(
                // Container para o botão "Buscar por Endereços"
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Buscar por Endereços",
                  iconData: Icons.location_city,
                  route: '/busca_cep/endereco',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 14), // Espaçamento entre widgets
              Container(
                // Container para o botão "Histórico"
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Histórico",
                  iconData: Icons.history,
                  route: '/busca_cep/history',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 4) // Espaçamento final
            ],
          ),
        ),
      ),
    );
  }
}
