import 'package:dio/dio.dart';  // Biblioteca Dio para fazer requisições HTTP
import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para injeção de dependências

// Classe useDio: Classe responsável por lidar com requisições utilizando Dio
class useDio {
  useDio() : super();  // Construtor padrão da classe

  // Método assíncrono que realiza uma requisição GET
  Future<Response> getResponse(String url) async {
    final Response response = await Dio().get(url);  // Realiza a requisição GET usando Dio
    if (response.statusCode == 200) {
      return response;  // Retorna a resposta se o código de status for 200 (OK)
    } else {
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');  // Lança uma exceção se ocorrer algum erro na requisição
    }
  }
}

// Classe udeDioModule: Classe que implementa o módulo do Dio para injeção de dependências
class udeDioModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton((i) => useDio());  // Registra useDio como um singleton para injeção de dependência
  }
}
