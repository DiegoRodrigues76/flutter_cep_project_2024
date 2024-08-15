import '../../data/model/cep_model.dart'; // Importa o modelo CepModel

// Define a interface do repositório de banco de dados de CEP
abstract class CepDbRepositoryInterface {
  // Método para adicionar dados ao banco de dados
  Future<void> addToDatabase(Map<String, dynamic> cepData);

  // Método para obter um CEP específico do banco de dados
  Future<CepModel> getFromDatabase(String cep);

  // Método para obter todos os CEPs do banco de dados
  Future<List<Map<String, dynamic>>> getCeps();

  // Método para deletar um CEP do banco de dados
  Future<void> deleteCep(String cep);
}
