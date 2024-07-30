import 'package:dio/dio.dart'; // Importa a biblioteca Dio, usada para fazer requisições HTTP
import '../../../../shared/dio/use_dio.dart'; // Importa uma classe personalizada para configurar e usar o Dio
import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart'; // Importa o modelo CepModel

abstract class CepRemoteDatasourceInterface {
  Future<CepModel> getCep(String cep); // Declara um método assíncrono para obter dados de um CEP
}

class CepRemoteDatasource extends CepRemoteDatasourceInterface {
  final UseDio _dio = UseDio(); // Instancia a classe UseDio para fazer requisições HTTP

  @override
  Future<CepModel> getCep(String cep) async {
    final regex = RegExp(r'^[0-9]{8}'); // Expressão regular para validar o formato do CEP (8 dígitos numéricos)
    
    // Verifica se o CEP fornecido corresponde ao formato esperado
    if (!regex.hasMatch(cep)) {
      throw Exception('CEP inválido'); // Lança uma exceção se o CEP não for válido
    }

    // Faz uma requisição HTTP GET para obter dados do CEP usando a URL fornecida
    final Response response = await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    
    // Verifica se a resposta da requisição foi bem-sucedida (código de status 200)
    if (response.statusCode == 200) {
      // Converte os dados da resposta (em JSON) para uma instância de CepModel e a retorna
      return CepModel.fromJson(response.data);
    } else {
      // Lança uma exceção se a resposta não for bem-sucedida, incluindo o código de status
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}
