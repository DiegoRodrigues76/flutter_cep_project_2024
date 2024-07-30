import 'package:flutter/material.dart'; // Importa o pacote de componentes de interface de usuário do Flutter
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart'; // Importa a classe CepHistoryStore, responsável por gerenciar o histórico de CEPs
import 'package:flutter_modular/flutter_modular.dart'; // Importa o Flutter Modular
class CepHistoryPage extends StatefulWidget {
  @override
  _CepHistoryPageState createState() => _CepHistoryPageState();
}

class _CepHistoryPageState extends State<CepHistoryPage> {
  List<Map<String, dynamic>> _ceps = []; // Lista para armazenar os CEPs consultados
  final CepHistoryStore _cepHistoryStore = Modular.get<CepHistoryStore>(); // Instancia a classe CepHistoryStore para gerenciar a injeção de dependência
  
  @override
  void initState() {
    super.initState();
    _loadCeps(); // Chama a função para carregar os CEPs ao iniciar o estado
  }

  Future<void> _loadCeps() async {
    final ceps = await _cepHistoryStore.getCeps(); // Obtém a lista de CEPs armazenados no CepHistoryStore
    setState(() {
      _ceps = ceps; // Atualiza a lista de CEPs e notifica o framework para redesenhar a interface
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de CEPs'), // Título da AppBar
      ),
      body: ListView.builder(
        itemCount: _ceps.length, // Define o número de itens na lista com base na quantidade de CEPs
        itemBuilder: (context, index) {
          final cep = _ceps[index]; // Acessa o CEP na posição do índice atual
          return Card(
            child: ListTile(
              title: Text(cep['cep'].toString()), // Exibe o CEP como título do ListTile
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Logradouro: ${cep['logradouro']}'), // Exibe o logradouro do CEP
                  Text('Bairro: ${cep['bairro']}'), // Exibe o bairro do CEP
                  Text('Localidade: ${cep['localidade']}'), // Exibe a localidade do CEP
                  Text('UF: ${cep['uf']}'), // Exibe a unidade federativa do CEP
                  Text('DDD: ${cep['ddd']}'), // Exibe o código de área (DDD) do CEP
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
