import 'package:dio/dio.dart';
import '../../../../shared/dio/use_dio.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';

// Interface que define os métodos para o datasource remoto de CEP
abstract class CepRemoteDatasourceInterface {
  Future<CepModel> getCep(String cep); // Obtém um CEP específico do serviço remoto
  Future<List<CepModel>> getCepList(String cep); // Obtém uma lista de CEPs do serviço remoto
}

// Implementação da interface do datasource remoto de CEP
class CepRemoteDatasource extends CepRemoteDatasourceInterface {
  // Instância da classe UseDio para gerenciar as requisições HTTP
  final UseDio _dio = UseDio();

  @override
  Future<CepModel> getCep(String cep) async {
    // Faz uma requisição HTTP para obter os dados do CEP
    final Response response =
        await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      // Se a resposta for bem-sucedida, converte os dados em um CepModel
      return CepModel.fromJson(response.data);
    } else {
      // Se a resposta falhar, lança uma exceção com o código de status
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }

  @override
  Future<List<CepModel>> getCepList(String cep) async {
    // Faz uma requisição HTTP com o dio para obter os dados de uma lista de CEPs
    final Response response =
        await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      // Se a resposta for bem-sucedida, converte os dados em uma lista de CepModel
      return (response.data as List)
          .map((cep) => CepModel.fromJson(cep))
          .toList();
    } else {
      // Se a resposta falhar, lança uma exceção com o código de status
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}
