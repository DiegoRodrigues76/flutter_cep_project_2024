import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo
import '../../data/repository/cep_repository.dart'; // Importa o repositório de CEP (CepRepository)
import '../../data/model/cep_model.dart'; // Importa o modelo de dados para CEP (CepModel)

// Define uma classe BuscaCepCase
class BuscaCepCase {
  // Obtém uma instância de CepRepository do container de injeção de dependências
  final CepRepository _cepRepository = Modular.get<CepRepository>();

  // Método assíncrono que obtém os dados de um CEP
  Future<CepModel> getCep(String cep) async {
    try {
      // Chama o método getCep do repositório para obter os dados do CEP e armazena no cepModel
      final CepModel cepModel = await _cepRepository.getCep(cep);
      return cepModel; // Retorna o modelo de dados do CEP
    } catch (e) {
      // Lança uma exceção com detalhes do erro caso a requisição falhe
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
}
