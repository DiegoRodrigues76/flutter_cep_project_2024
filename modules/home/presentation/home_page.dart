import 'package:flutter/material.dart';  // Biblioteca Flutter para construção de UIs
import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para gerenciamento de rotas e injeção de dependências

// Classe HomePage: Representa a página inicial do aplicativo
class HomePage extends StatelessWidget {
  const HomePage({super.key});  // Construtor da classe HomePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),  // Título da AppBar
        backgroundColor: Colors.blue,  // Cor de fundo da AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // Espaçamento interno do widget
          child: ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed('/busca_cep');  // Navega para a rota '/busca_cep' ao pressionar o botão
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,  // Cor de fundo do botão
              minimumSize: const Size(double.infinity, 60.0),  // Tamanho mínimo do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),  // Borda arredondada do botão
              ),
            ),
            child: const Text(
              'Buscar CEP',  // Texto do botão
              style: TextStyle(fontSize: 24.0, color: Colors.black),  // Estilo do texto
            ),
          ),
        ),
      ),
    );
  }
}
