import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para injeção de dependências e gerenciamento de rotas
import 'home/presentation/home_page.dart';  // Importa a página inicial da pasta home/presentation
import 'consulta_cep/presentation/busca_cep_page.dart';  // Importa a página de busca de CEP da pasta consulta_cep/presentation
import 'consulta_cep/data/cep_repository.dart';  // Importa o repositório de CEP da pasta consulta_cep/data
import '../shared/dio/use_dio.dart';  // Importa o uso da biblioteca Dio compartilhado

// Classe AppModule: Define o módulo principal do aplicativo usando Flutter Modular
class AppModule extends Module {
  @override
  void binds(i) {
    i.add(useDio.new);  // Registra o uso da classe useDio para injeção de dependência
    i.add(CepRepository.new);  // Registra o repositório de CEP para injeção de dependência
  }

  @override
    void routes(r) {
    r.child('/',child: (_,) =>const HomePage()); // Define a rota raiz '/' que exibe a HomePage
    r.child('/busca_cep',child: (_,) =>const BuscaCepPage()); // Define a rota '/busca_cep' que exibe a BuscaCepPage
  }
}
