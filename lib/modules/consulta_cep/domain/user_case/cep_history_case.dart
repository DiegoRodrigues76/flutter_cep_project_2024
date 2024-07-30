import '../../data/model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP
import '../repository/cep_db_repository_interface.dart'; // Importa a interface de repositório para acesso ao banco de dados de CEPs

class CepHistoryCase {
  final CepDbRepositoryInterface _cepDbRepositoryInterface; // Declaração da interface do repositório de banco de dados de CEPs

  CepHistoryCase(this._cepDbRepositoryInterface); // Construtor que inicializa a interface de repositório com uma implementação fornecida

  // Método para adicionar dados de um CEP ao banco de dados
  Future<void> addToDatabase(Map<String, Object> cepData) {
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }

  // Método para obter os dados de um CEP específico a partir do banco de dados
  Future<CepModel> getFromDatabase(String cep) {
    return _cepDbRepositoryInterface.getFromDatabase(cep);
  }

  // Método para obter uma lista de todos os CEPs armazenados no banco de dados
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepDbRepositoryInterface.getCeps();
  }

  // Método para deletar os dados de um CEP específico do banco de dados
  Future<void> deleteCep(String cep) {
    return _cepDbRepositoryInterface.deleteCep(cep);
  }
}
