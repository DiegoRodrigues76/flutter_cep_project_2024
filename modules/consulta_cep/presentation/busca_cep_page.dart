import 'package:flutter/material.dart';  // Biblioteca Flutter para construção de UIs
import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para injeção de dependências e gerenciamento de rotas
import '../data/cep_repository.dart';  // Importa o repositório de CEP do diretório data
import '../data/cep_model.dart';  // Importa o modelo de CEP do diretório data

// Classe BuscaCepPage: Define a página de busca de CEP do aplicativo
class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});  // Construtor da classe BuscaCepPage

  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();  // Cria o estado associado à BuscaCepPage
}

// Classe _BuscaCepPageState: Define o estado da página de busca de CEP
class _BuscaCepPageState extends State<BuscaCepPage> {
  final TextEditingController _textController = TextEditingController();  // Controlador do campo de texto para inserção do CEP
  String _displayText = '';  // String para exibição do resultado da busca de CEP
  final CepRepository _cepRepository = Modular.get<CepRepository>();  // Instância do repositório de CEP obtida através do Flutter Modular

  // Método assíncrono para confirmar o texto inserido no campo de CEP
  Future<void> _confirmText() async {
    final String cep = _textController.text;  // Obtém o texto inserido no campo de CEP
    try {
      final CepModel cepModel = await _cepRepository.getCep(cep);  // Obtém o modelo de CEP a partir do repositório
      setState(() {
        // Atualiza o estado para exibir as informações do CEP obtido
        _displayText = 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
      });
    } catch (e) {
      setState(() {
        // Em caso de erro, atualiza o estado para exibir a mensagem de erro
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),  // Título da AppBar
        backgroundColor: Colors.blue,  // Cor de fundo da AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,  // Define o controlador para o campo de texto
                decoration: const InputDecoration(
                  labelText: 'Digite um CEP',  // Rótulo do campo de texto
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmText,  // Define a ação ao pressionar o botão
              child: const Text(
                'Confirmar',  // Texto do botão de confirmação
                style: TextStyle(color: Colors.black),  // Estilo do texto do botão
              ),
            ),
            const SizedBox(height: 16.0),  // Espaçamento entre widgets
            Text(
              _displayText,  // Exibe o texto de resultado da busca de CEP
              style: const TextStyle(fontSize: 16.0),  // Estilo do texto de resultado
            ),
          ],
        ),
      ),
    );
  }
}
