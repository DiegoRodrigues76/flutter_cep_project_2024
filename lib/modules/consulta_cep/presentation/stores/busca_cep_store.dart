import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo
import '../../domain/user_case/busca_cep_case.dart'; // Importa o caso de uso de busca de CEP (BuscaCepCase)
import '../../data/model/cep_model.dart'; // Importa o modelo de dados para CEP (CepModel)

// Define uma classe BuscaCepStore
class BuscaCepStore {
  // Obtém uma instância de BuscaCepCase do container de injeção de dependências
  final _buscaCepCase = Modular.get<BuscaCepCase>();

  // Método assíncrono que obtém os detalhes de um CEP e retorna uma string formatada
  Future<String> getText(String cep) async {
    // Chama o método getCep do caso de uso para obter os dados do CEP e armazena no cepModel
    final CepModel cepModel = await _buscaCepCase.getCep(cep);
    
    // Retorna uma string formatada com os detalhes do CEP
    return 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
  }
}
