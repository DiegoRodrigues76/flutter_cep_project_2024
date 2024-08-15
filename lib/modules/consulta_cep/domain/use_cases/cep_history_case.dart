import '../../data/model/cep_model.dart';
import '../repository/cep_db_repository_interface.dart';

// Caso de uso para histórico de CEPs
class CepHistoryCase {
  // Interface do repositório do banco de dados de CEP
  final CepDbRepositoryInterface _cepDbRepositoryInterface;

  // Construtor que inicializa a interface do repositório de banco de dados
  CepHistoryCase(this._cepDbRepositoryInterface);

  // Método para adicionar dados de CEP ao banco de dados
  Future<void> addToDatabase(Map<String, Object> cepData) {
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }

  // Método para obter dados de um CEP específico do banco de dados
  Future<CepModel> getFromDatabase(String cep) {
    return _cepDbRepositoryInterface.getFromDatabase(cep);
  }

  // Método para obter todos os CEPs armazenados no banco de dados
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepDbRepositoryInterface.getCeps();
  }

  // Método para deletar um CEP específico do banco de dados
  Future<void> deleteCep(String cep) {
    return _cepDbRepositoryInterface.deleteCep(cep);
  }
}
