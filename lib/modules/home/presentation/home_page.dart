import 'package:flutter/material.dart';
// Importa a biblioteca de widgets do Flutter, que fornece os componentes básicos da interface de usuário

import 'package:flutter_modular/flutter_modular.dart';
// Importa o pacote Flutter Modular para modularização do aplicativo

class HomePage extends StatelessWidget {
  // Define uma classe `HomePage` que estende `StatelessWidget`

  @override
  Widget build(BuildContext context) {
    // O método `build` é responsável por construir a interface de usuário para esta página
    
    return Scaffold(
      // `Scaffold` é um widget de layout que oferece uma estrutura visual básica para o aplicativo, incluindo barra de aplicativos, corpo, etc.

      appBar: AppBar(
        title: const Text('Busca CEP'),
        backgroundColor: Colors.blue,
        // Define a barra de aplicativos com o título "Busca CEP" e um fundo azul
      ),
      
      body: Center(
        // Centraliza o conteúdo do corpo

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Aplica um preenchimento (padding) ao redor dos widgets filhos

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Alinha os filhos verticalmente ao centro

            children: [
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/busca_cep');
                  // Navega para a rota '/busca_cep' quando o botão é pressionado
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  minimumSize: const Size(double.infinity, 60.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // Estiliza o botão com uma cor de fundo azul claro, tamanho mínimo, e bordas arredondadas
                ),
                child: const Text(
                  'Buscar CEP',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                  // Define o texto do botão com um tamanho de fonte maior e cor preta
                ),
              ),
              
              const SizedBox(height: 16.0),
              // Adiciona um espaço vertical de 16 pixels entre os botões

              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/busca_cep/history');
                  // Navega para a rota '/busca_cep/history' quando o botão é pressionado
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[200],
                  minimumSize: const Size(double.infinity, 60.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // Estiliza o botão com uma cor de fundo verde claro, tamanho mínimo, e bordas arredondadas
                ),
                child: const Text(
                  'Histórico de CEPs',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                  // Define o texto do botão com um tamanho de fonte maior e cor preta
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
