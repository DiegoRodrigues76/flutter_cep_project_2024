import 'package:dio/dio.dart';  // Biblioteca Dio para realizar requisições HTTP
import '../../../shared/dio/use_dio.dart';  // Importa a classe useDio do diretório shared/dio
import 'cep_model.dart';  // Importa o modelo de CEP

// Classe CepRepository: Responsável por realizar operações relacionadas a CEPs
class CepRepository {
  final useDio _dio = useDio();  // Instância da classe useDio para realizar requisições HTTP

  // Método assíncrono para obter informações de um CEP específico
  Future<CepModel> getCep(String cep) async {
    final regex = RegExp(r'^[0-9]{8}');  // Expressão regular para validar o formato do CEP
    if (!regex.hasMatch(cep)) {  // Verifica se o formato do CEP é válido
      throw Exception('CEP inválido');  // Lança uma exceção se o formato do CEP for inválido
    }
    final Response response = await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');  // Realiza a requisição HTTP para obter os dados do CEP
    if (response.statusCode == 200) {  // Verifica se a requisição foi bem-sucedida (código de status 200)
      return CepModel.fromJson(response.data);  // Converte os dados da resposta em um objeto CepModel usando o método fromJson
    } else {  // Caso contrário, se a requisição não for bem-sucedida
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');  // Lança uma exceção informando o código de status da resposta
    }
  }
}
