import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart'; // Importa a interface para a fonte de dados local de CEPs
import '../model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP
import '../../domain/repository/cep_db_repository_interface.dart'; // Importa a interface do repositório de banco de dados de CEPs

class CepDbRepository extends CepDbRepositoryInterface {
  final CepLocalDatasourceInterface _cepLocalDatasourceInterface; // Declaração da interface para a fonte de dados local de CEPs

  CepDbRepository(this._cepLocalDatasourceInterface); // Construtor que inicializa a fonte de dados local com uma implementação fornecida

  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) {
    return _cepLocalDatasourceInterface.addToDatabase(cepData); // Adiciona dados de um CEP ao banco de dados local
  }

  @override
  Future<void> deleteCep(String cep) {
    return _cepLocalDatasourceInterface.deleteCep(cep); // Deleta um CEP específico do banco de dados local
  }

  @override
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepLocalDatasourceInterface.getCeps(); // Obtém todos os CEPs armazenados no banco de dados local
  }

  @override
  Future<CepModel> getFromDatabase(String cep) {
    return _cepLocalDatasourceInterface.getFromDatabase(cep); // Obtém os dados de um CEP específico do banco de dados local
  }
}
