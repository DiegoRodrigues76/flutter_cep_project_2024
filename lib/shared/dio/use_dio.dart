import 'package:dio/dio.dart'; // Importa o pacote Dio para fazer requisições HTTP
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo

// Define uma classe useDio
class useDio {
  // Construtor da classe useDio
  useDio() : super();
  
  // Método assíncrono que faz uma requisição GET para uma URL fornecida
  Future<Response> getResponse(String url) async {
    // Faz a requisição GET usando Dio e armazena a resposta na variável response
    final Response response = await Dio().get(url);
    
    // Verifica se o status da resposta é 200 (OK)
    if (response.statusCode == 200) {
      return response; // Retorna a resposta se o status for 200
    } else {
      // Lança uma exceção se o status não for 200
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}

// Define uma classe udeDioModule que extende Module do Flutter Modular
class udeDioModule extends Module {
  // Sobrescreve o método exportedBinds para registrar a dependência useDio
  @override
  void exportedBinds(i) {
    // Adiciona uma instância singleton de useDio ao container de injeção de dependências
    i.addSingleton((i) => useDio());
  }
}
