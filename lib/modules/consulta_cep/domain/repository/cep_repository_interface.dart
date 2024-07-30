import '../../data/model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP

abstract class CepRepositoryInterface {
  Future<CepModel> getCep(String cep); // Declaração de um método assíncrono para obter os dados de um CEP
}
