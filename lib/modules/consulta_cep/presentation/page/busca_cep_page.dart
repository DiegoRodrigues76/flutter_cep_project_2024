import 'package:flutter/material.dart'; // Importa o pacote Flutter para construir a interface do usuário
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para navegação e modularização
import '../stores/busca_cep_store.dart'; // Importa a store de busca de CEP (BuscaCepStore)

// Define um widget com estado chamado BuscaCepPage
class BuscaCepPage extends StatefulWidget {
  // Construtor da BuscaCepPage com uma chave opcional
  const BuscaCepPage({super.key});

  // Cria o estado para o widget BuscaCepPage
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

// Define o estado do widget BuscaCepPage
class _BuscaCepPageState extends State<BuscaCepPage> {
  // Controlador de texto para o campo de entrada de CEP
  final TextEditingController _textController = TextEditingController();
  // String para armazenar o texto a ser exibido
  String _displayText = '';
  // Instância de BuscaCepStore obtida via injeção de dependência do Modular
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();

  // Método assíncrono que confirma o texto digitado e atualiza a exibição
  Future<void> _confirmText() async {
    final String cep = _textController.text; // Obtém o texto digitado (CEP)
    try {
      // Chama o método getText da store para obter os detalhes do CEP
      final String cepText = await _buscaCepStore.getText(cep);
      // Atualiza o estado com os detalhes do CEP
      setState(() {
        _displayText = cepText;
      });
    } catch (e) {
      // Atualiza o estado com a mensagem de erro caso a requisição falhe
      setState(() {
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e';
      });
    }
  }

  // Constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'), // Define o título da AppBar
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Adiciona um padding de 16 pixels em todos os lados
              child: TextField(
                controller: _textController, // Define o controlador do campo de texto
                decoration: const InputDecoration(
                  labelText: 'Digite um CEP', // Define o rótulo do campo de texto
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmText, // Chama o método _confirmText ao pressionar o botão
              child: const Text(
                'Confirmar', // Texto exibido no botão
                style: TextStyle(color: Colors.black), // Estilo do texto do botão
              ),
            ),
            const SizedBox(height: 16.0), // Adiciona um espaço vertical de 16 pixels
            Text(
              _displayText, // Exibe o texto armazenado em _displayText
              style: const TextStyle(fontSize: 16.0), // Estilo do texto exibido
            ),
          ],
        ),
      ),
    );
  }
}
