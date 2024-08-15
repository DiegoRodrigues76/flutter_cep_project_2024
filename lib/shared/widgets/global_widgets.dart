import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'global_themes.dart';

// Classe que contém widgets e estilos globais para o aplicativo
class GlobalWidgets {
  // Instância estática da classe ThemeColors para usar as cores definidas
  static ThemeColors themeColors = ThemeColors();
  
  // Estilo de texto para campos de entrada
  TextStyle textInputStyle = TextStyle(
    color: themeColors.black, // Cor do texto
    fontSize: 16, // Tamanho da fonte
    fontFamily: 'Inter', // Família da fonte
    fontWeight: FontWeight.w400, // Peso da fonte
  );
  
  // Estilo de texto para botões
  TextStyle buttonTextStyle = TextStyle(
    color: themeColors.black, // Cor do texto
    fontSize: 16, // Tamanho da fonte
    fontFamily: 'Inter', // Família da fonte
    fontWeight: FontWeight.w400, // Peso da fonte
  );
  
  // Estilo de texto para títulos
  TextStyle titleStyle = TextStyle(
    color: themeColors.black, // Cor do texto
    fontSize: 30, // Tamanho da fonte
    fontFamily: 'Inter', // Família da fonte
    fontWeight: FontWeight.w400, // Peso da fonte
  );
  
  // Estilo de texto para menus
  TextStyle menuStyle = TextStyle(
    color: themeColors.black, // Cor do texto
    fontSize: 17, // Tamanho da fonte
    fontFamily: 'Signika', // Família da fonte
    fontWeight: FontWeight.w400, // Peso da fonte
  );
  
  // Ícone de seta para seleção
  Icon selectArrow = Icon(
    Icons.arrow_forward_ios, // Ícone da seta
    color: themeColors.iconPurple, // Cor do ícone
    size: 24, // Tamanho do ícone
  );
  
  // Método para criar ícones de menu com base no ícone fornecido
  Icon menuIcon(IconData iconData) {
    return Icon(
      iconData, // Dados do ícone
      color: themeColors.white, // Cor do ícone
      size: 24, // Tamanho do ícone
    );
  }

  // Estilo da borda para campos de entrada
  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(22), // Raio da borda
    borderSide: BorderSide(
      color: themeColors.black, // Cor da borda
      width: 1, // Largura da borda
    ),
  );
  
  // Estilo dos botões elevados
  ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xCCEE82EE), // Cor de fundo do botão
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24), // Raio das bordas do botão
    ),
    visualDensity: const VisualDensity(
      vertical: -4, // Densidade vertical do botão
      horizontal: -4, // Densidade horizontal do botão
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 30, // Espaçamento horizontal
      vertical: 14, // Espaçamento vertical
    ),
  );

  // Método para criar um widget de seleção com ícone e texto
  Widget buildSelection(
    BuildContext context, {
    required String text, // Texto a ser exibido
    required IconData iconData, // Dados do ícone
    required String route, // Rota para navegação
    required bool returnable, // Indica se a navegação deve retornar ou não
    modalBuilder, // Função para construir o modal, se necessário
  }) {
    return GestureDetector(
      onTap: () {
        if (!returnable) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return modalBuilder(context, text, route); // Cria o modal usando o modalBuilder
            },
          );
        } else {
          Modular.to.pushNamed(route); // Navega para a rota especificada
        }
      },
      child: Container(
        color: Colors.transparent, // Cor de fundo transparente
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento centralizado
          children: [
            Container(
              width: 48, // Largura do contêiner
              height: 48, // Altura do contêiner
              decoration: BoxDecoration(
                color: themeColors.purple, // Cor de fundo do contêiner
                borderRadius: BorderRadius.circular(8), // Raio das bordas
              ),
              padding: const EdgeInsets.all(12), // Padding interno
              child: menuIcon(iconData), // Adiciona o ícone de menu
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16), // Espaçamento à esquerda do texto
              child: Text(
                text, // Texto a ser exibido
                style: menuStyle, // Estilo do texto
              ),
            ),
            const Spacer(), // Espaço flexível entre o texto e o ícone
            selectArrow, // Ícone de seta
          ],
        ),
      ),
    );
  }
}
