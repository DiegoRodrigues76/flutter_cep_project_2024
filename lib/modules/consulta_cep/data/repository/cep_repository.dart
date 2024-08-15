import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import '../model/cep_model.dart';
import '../../domain/repository/cep_repository_interface.dart';

// Implementação da interface CepRepositoryInterface
class CepRepository extends CepRepositoryInterface {
  // Instância da interface CepRemoteDatasourceInterface
  final CepRemoteDatasourceInterface _cepRemoteDatasourceInterface;

  // Construtor da classe que inicializa a instância de CepRemoteDatasourceInterface
  CepRepository(this._cepRemoteDatasourceInterface);

  // Método para obter os dados de um CEP específico
  @override
  Future<CepModel> getCep(String cep) async {
    return await _cepRemoteDatasourceInterface.getCep(cep);
  }
  
  // Método para obter uma lista de CEPs
  @override
  Future<List<CepModel>> getCepList(String cep) async {
    return await _cepRemoteDatasourceInterface.getCepList(cep);
  }
}
