import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para injeção de dependências

// Importando classes próprias
import 'data/cep_repository.dart';  // Importa a classe CepRepository do diretório data
import '../../shared/dio/use_dio.dart';  // Importa a classe useDio do diretório shared/dio

// Classe AppModule: Define o módulo principal do aplicativo usando Flutter Modular
class AppModule extends Module {
  @override
  void binds(i) {
    i.add(useDio.new);  // Registra o uso da classe useDio para injeção de dependência
    i.add(CepRepository.new);  // Registra o repositório de CEP para injeção de dependência
  }
}
