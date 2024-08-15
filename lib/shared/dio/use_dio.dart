import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Classe para encapsular o uso do Dio, uma biblioteca para requisições HTTP
class UseDio {
  // Construtor da classe
  UseDio() : super();

  // Método assíncrono para fazer uma requisição GET e obter a resposta
  Future<Response> getResponse(String url) async {
    // Cria uma instância do Dio e faz uma requisição GET para a URL fornecida
    final Response response = await Dio().get(url);

    // Verifica se o código de status da resposta é 200 (OK)
    if (response.statusCode == 200) {
      return response; // Retorna a resposta se o status for OK
    } else {
      // Lança uma exceção se o status não for 200, com uma mensagem de erro
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}

// Módulo para injeção de dependências do UseDio
class UseDioModule extends Module {
  @override
  void exportedBinds(i) {
    // Registra a instância do UseDio como singleton para ser usada em toda a aplicação
    i.addSingleton((i) => UseDio());
  }
}
