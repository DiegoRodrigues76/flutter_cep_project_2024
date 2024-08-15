import '../../data/model/cep_model.dart';
import '../repository/cep_repository_interface.dart';
import '../repository/cep_db_repository_interface.dart';

// Caso de uso para a busca de CEPs
class BuscaCepCase {
  // Interfaces dos repositórios de CEP e banco de dados
  final CepRepositoryInterface _cepRepositoryInterface;
  final CepDbRepositoryInterface _cepDbRepositoryInterface;

  // Construtor que inicializa as interfaces dos repositórios
  BuscaCepCase(this._cepRepositoryInterface, this._cepDbRepositoryInterface);

  // Método para obter os dados de um CEP específico
  Future<CepModel> getCep(cep) async {
    try {
      final CepModel cepModel = await _cepRepositoryInterface.getCep(cep);
      return cepModel;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }

  // Método para obter uma lista de CEPs
  Future<List<CepModel>> getCepList(cep) async {
    try {
      final List<CepModel> cepModel = await _cepRepositoryInterface.getCepList(cep);
      return cepModel; 
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }

  // Método para adicionar um CEP ao banco de dados local
  Future<void> addToDatabase(Map<String, dynamic> cepData) {
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }
}
