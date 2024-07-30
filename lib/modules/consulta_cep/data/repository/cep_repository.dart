import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart'; // Importa a interface para a fonte de dados remota de CEPs
import '../model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP
import '../../domain/repository/cep_repository_interface.dart'; // Importa a interface do repositório de CEPs

class CepRepository extends CepRepositoryInterface {
  final CepRemoteDatasourceInterface _cepRemoteDatasourceInterface; // Declaração da interface para a fonte de dados remota de CEPs

  CepRepository(this._cepRemoteDatasourceInterface); // Construtor que inicializa a fonte de dados remota com uma implementação fornecida

  @override
  Future<CepModel> getCep(String cep) async {
    return await _cepRemoteDatasourceInterface.getCep(cep); // Obtém os dados de um CEP usando a fonte de dados remota
  }
}
