import '../../data/model/cep_model.dart'; // Importa o modelo CepModel, que representa a estrutura dos dados de um CEP

abstract class CepDbRepositoryInterface {
  Future<void> addToDatabase(Map<String, dynamic> cepData); // Declaração de um método para adicionar dados de CEP ao banco de dados
  Future<CepModel> getFromDatabase(String cep); // Declaração de um método para obter os dados de um CEP específico do banco de dados
  Future<List<Map<String, dynamic>>> getCeps(); // Declaração de um método para obter todos os CEPs armazenados no banco de dados
  Future<void> deleteCep(String cep); // Declaração de um método para deletar um CEP específico do banco de dados
}
