import '../../data/model/cep_model.dart';

// Interface que define os métodos para o repositório de CEP
abstract class CepRepositoryInterface {
  // Método para obter os dados de um CEP específico
  Future<CepModel> getCep(String cep);

  // Método para obter uma lista de CEPs
  Future<List<CepModel>> getCepList(String cep);
}
