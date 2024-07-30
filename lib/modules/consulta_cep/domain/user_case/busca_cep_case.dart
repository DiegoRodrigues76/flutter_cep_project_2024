import '../../data/model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP
import '../repository/cep_repository_interface.dart'; // Importa a interface para o repositório de busca de CEPs
import '../repository/cep_db_repository_interface.dart'; // Importa a interface para o repositório de banco de dados de CEPs

class BuscaCepCase {
  final CepRepositoryInterface _cepRepositoryInterface; // Declaração da interface do repositório para buscar dados de CEPs
  final CepDbRepositoryInterface _cepDbRepositoryInterface; // Declaração da interface do repositório para operações de banco de dados de CEPs

  BuscaCepCase(this._cepRepositoryInterface, this._cepDbRepositoryInterface); // Construtor que inicializa as interfaces de repositório com implementações fornecidas

  // Método para obter os dados de um CEP utilizando o repositório de busca de CEPs
  Future<CepModel> getCep(String cep) async {
    try {
      final CepModel cepModel = await _cepRepositoryInterface.getCep(cep); // Busca o CEP utilizando o repositório
      return cepModel; // Retorna o modelo do CEP encontrado.
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e'); // Lança uma exceção em caso de erro na requisição
    }
  }

  // Método para adicionar dados de um CEP ao banco de dados
  Future<void> addToDatabase(Map<String, dynamic> cepData) {
    return _cepDbRepositoryInterface.addToDatabase(cepData); // Adiciona o CEP ao banco de dados utilizando o repositório de banco de dados
  }
}
