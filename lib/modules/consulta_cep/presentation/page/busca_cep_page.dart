import 'package:flutter/material.dart';
import '../stores/busca_cep_store.dart'; // Importa a classe BuscaCepStore, responsável pela lógica de busca de CEP
import '../../../../shared/mobx/loading_store.dart'; // Importa a classe LoadingStore, utilizada para gerenciar o estado de carregamento
import 'package:flutter_mobx/flutter_mobx.dart'; // Importa o pacote flutter_mobx para usar o Observer com MobX
import 'package:flutter_modular/flutter_modular.dart'; // Importa o Flutter Modular para gerenciamento de dependências e rotas

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  final loadingStore = LoadingStore(); // Instancia o LoadingStore para controlar o estado de carregamento
  final TextEditingController _textController = TextEditingController(); // Controlador para o campo de texto que armazena o CEP inserido
  String _displayText = ''; // Texto a ser exibido como resultado ou mensagem de erro
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>(); // Instancia o BuscaCepStore usando o Modular para gerenciar a injeção de dependência

  // Função que é chamada ao confirmar o texto digitado
  Future<void> _confirmText() async {
    loadingStore.isLoading = true; // Inicia o estado de carregamento
    final String cep = _textController.text; // Obtém o CEP digitado pelo usuário
    try {
      final String cepText = await _buscaCepStore.getText(cep); // Faz a requisição para obter os dados do CEP
      await Future.delayed(const Duration(seconds: 1)); // Adiciona um atraso para simular tempo de carregamento
      setState(() {
        loadingStore.isLoading = false; // Encerra o estado de carregamento
        _displayText = cepText; // Atualiza o texto a ser exibido com o resultado da busca
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2)); // Adiciona um atraso antes de exibir o erro
      setState(() {
        loadingStore.isLoading = false; // Encerra o estado de carregamento
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e'; // Exibe uma mensagem de erro
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'), // Título da AppBar
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController, // Controlador do campo de texto para capturar a entrada do usuário
                decoration: const InputDecoration(
                  labelText: 'Digite um CEP', // Rótulo do campo de texto
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmText, // Chama a função _confirmText ao pressionar o botão
              child: const Text(
                'Confirmar',
                style: TextStyle(color: Colors.black), // Cor do texto do botão
              ),
            ),
            const SizedBox(height: 16.0),
            Observer(builder: (_) { // Observer para reagir às mudanças no estado de carregamento
              if (loadingStore.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(), // Exibe um indicador de carregamento enquanto o estado é true
                );
              } else {
                return Text(
                  _displayText, // Exibe o texto resultante ou mensagem de erro
                  style: const TextStyle(fontSize: 16.0), // Estilo do texto
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
