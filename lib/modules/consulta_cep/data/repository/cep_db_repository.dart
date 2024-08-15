import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import '../model/cep_model.dart';
import '../../domain/repository/cep_db_repository_interface.dart';

// Implementação da interface CepDbRepositoryInterface
class CepDbRepository extends CepDbRepositoryInterface {
  // Instância da interface CepLocalDatasourceInterface
  final CepLocalDatasourceInterface _cepLocalDatasourceInterface;

  // Construtor da classe que inicializa a instância de CepLocalDatasourceInterface
  CepDbRepository(this._cepLocalDatasourceInterface);

  // Método para adicionar um CEP ao banco de dados
  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) {
    return _cepLocalDatasourceInterface.addToDatabase(cepData);
  }  

  // Método para deletar um CEP do banco de dados
  @override
  Future<void> deleteCep(String cep) {
    return _cepLocalDatasourceInterface.deleteCep(cep);
  }

  // Método para obter uma lista de todos os CEPs do banco de dados
  @override
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepLocalDatasourceInterface.getCeps();
  }

  // Método para obter um CEP específico do banco de dados
  @override
  Future<CepModel> getFromDatabase(String cep) {
    return _cepLocalDatasourceInterface.getFromDatabase(cep);
  }
}
