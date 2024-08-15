import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart'; // Importa a loja de histórico de CEPs
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote para modularização do Flutter

// Define a página para exibição do histórico de CEPs
class CepHistoryPage extends StatefulWidget {
  const CepHistoryPage({super.key}); // Construtor da página com chave opcional
  @override
  _CepHistoryPageState createState() => _CepHistoryPageState(); // Cria o estado da página
}

class _CepHistoryPageState extends State<CepHistoryPage> {
  List<Map<String, dynamic>> _ceps = []; // Lista para armazenar os CEPs
  final CepHistoryStore _cepHistoryStore = Modular.get<CepHistoryStore>(); // Instância da loja de histórico de CEPs obtida através do Modular

  @override
  void initState() {
    super.initState();
    _loadCeps(); // Carrega os CEPs ao iniciar o estado
  }

  // Função para carregar os CEPs do histórico
  Future<void> _loadCeps() async {
    final ceps = await _cepHistoryStore.getCeps(); // Obtém a lista de CEPs da loja
    setState(() {
      _ceps = ceps; // Atualiza o estado com a lista de CEPs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico de CEPs', // Título da barra de app
          style: TextStyle(color: Colors.black), // Estilo do texto do título
        ),
        backgroundColor: Colors.white, // Cor de fundo da barra de app
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      backgroundColor: Colors.white, // Cor de fundo da página
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0), // Margens ao redor do texto
            child: Text(
              "Histórico", // Título da seção
              style: TextStyle(
                color: Colors.black, // Cor do texto
                fontFamily: 'Inter', // Família da fonte
                fontSize: 30, // Tamanho da fonte
                fontWeight: FontWeight.w400, // Peso da fonte
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _ceps.length, // Número de itens na lista
              itemBuilder: (context, index) {
                final cep = _ceps[index]; // Obtém o CEP da lista pelo índice
                return Card(
                  child: ListTile(
                    title: Text(cep['cep'].toString()), // Exibe o CEP
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
                      children: [
                        Text('Logradouro: ${cep['logradouro']}'), // Exibe o logradouro
                        Text('Bairro: ${cep['bairro']}'), // Exibe o bairro
                        Text('Localidade: ${cep['localidade']}'), // Exibe a localidade
                        Text('UF: ${cep['uf']}'), // Exibe a unidade federativa
                        Text('DDD: ${cep['ddd']}'), // Exibe o DDD
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
