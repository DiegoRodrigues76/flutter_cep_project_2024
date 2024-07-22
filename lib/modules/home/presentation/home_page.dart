import 'package:flutter/material.dart'; // Importa o pacote Flutter para construir a interface do usuário
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para navegação e modularização

// Define um widget sem estado chamado HomePage
class HomePage extends StatelessWidget {
  // Construtor da HomePage com uma chave opcional
  const HomePage({super.key});

  // Sobrescreve o método build para construir a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'), // Define o título da AppBar
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adiciona um padding de 16 pixels em todos os lados
          child: ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed('/busca_cep'); // Navega para a rota '/busca_cep' quando o botão é pressionado
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue, // Define a cor de fundo do botão
              minimumSize: const Size(double.infinity, 60.0), // Define o tamanho mínimo do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Define o raio de borda do botão
              ),
            ),
            child: const Text(
              'Buscar CEP', // Texto exibido no botão
              style: TextStyle(fontSize: 24.0, color: Colors.black), // Estilo do texto do botão
            ),
          ),
        ),
      ),
    );
  }
}
