import 'package:dio/dio.dart'; 
// Importa o pacote Dio para fazer requisições HTTP

import 'package:flutter_modular/flutter_modular.dart'; 
// Importa o pacote Flutter Modular para modularização do aplicativo

class UseDio {
  UseDio() : super();
  // Construtor da classe `UseDio`

  Future<Response> getResponse(String url) async {
    // Método assíncrono que faz uma requisição GET para a URL fornecida.
    
    final Response response = await Dio().get(url);
    // Faz a requisição HTTP GET usando Dio e espera a resposta

    if (response.statusCode == 200) {
      return response;
      // Se o código de status da resposta for 200 (OK), retorna a resposta.
    } else {
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
      // Caso contrário, lança uma exceção com uma mensagem de erro
    }
  }
}

class UseDioModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton((i) => UseDio());
    // Método que registra `UseDio` como um singleton no container de injeção de dependências do Flutter Modular
  }
}
