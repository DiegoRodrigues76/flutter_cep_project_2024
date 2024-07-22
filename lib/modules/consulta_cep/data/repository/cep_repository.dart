import 'package:dio/dio.dart'; // Importa a biblioteca Dio para realizar requisições HTTP
import '../../../../shared/dio/use_dio.dart'; // Importa uma função ou classe customizada para usar o Dio
import '../model/cep_model.dart'; // Importa o modelo CepModel
import '../../domain/repository/cep_repository_interface.dart'; // Importa a interface do repositório de CEP

// Define a classe CepRepository que implementa a interface CepRepositoryInterface
class CepRepository extends CepRepositoryInterface{
  // Cria uma instância da classe useDio
  final useDio _dio = useDio();

  // Implementa o método getCep que recebe um CEP (Código de Endereçamento Postal) e retorna um CepModel
  @override
  Future<CepModel> getCep(String cep) async {
    // Define uma expressão regular para validar o CEP (somente números e deve ter 8 dígitos)
    final regex = RegExp(r'^[0-9]{8}');
    
    // Verifica se o CEP é válido, caso contrário lança uma exceção
    if(!regex.hasMatch(cep)) {
      throw Exception('CEP inválido');
    }
    
    // Faz uma requisição GET para a URL da API ViaCEP com o CEP fornecido
    final Response response = await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    
    // Se a resposta for bem-sucedida (código de status 200), converte os dados JSON para um objeto CepModel
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.data);
    } else {
      // Se a resposta não for bem-sucedida, lança uma exceção com o código de status da resposta
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}
