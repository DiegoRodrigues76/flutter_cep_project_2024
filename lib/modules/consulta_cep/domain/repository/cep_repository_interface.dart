import '../../data/model/cep_model.dart'; // Importa o modelo de dados para CEP (CepModel)

// Define uma interface abstrata chamada CepRepositoryInterface
abstract class CepRepositoryInterface {
  // Declara um método assíncrono que deve ser implementado para obter os dados de um CEP
  Future<CepModel> getCep(String cep);
}
