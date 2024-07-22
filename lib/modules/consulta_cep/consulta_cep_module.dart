import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo
import 'domain/user_case/busca_cep_case.dart'; // Importa o caso de uso de busca de CEP (BuscaCepCase)
import '../../shared/dio/use_dio.dart'; // Importa a classe useDio para requisições HTTP

// Define uma classe AppModule que extende Module do Flutter Modular
class AppModule extends Module {
  // Sobrescreve o método binds para registrar dependências
  @override
  void binds(i) {
    i.add(useDio.new); // Adiciona a instância de useDio ao container de injeção de dependências
    i.add(BuscaCepCase.new); // Adiciona a instância de BuscaCepCase ao container de injeção de dependências
  }
}
