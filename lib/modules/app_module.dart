import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo
import 'home/presentation/home_page.dart'; // Importa a página inicial (HomePage)
import 'consulta_cep/presentation/page/busca_cep_page.dart'; // Importa a página de busca de CEP (BuscaCepPage)
import 'consulta_cep/presentation/stores/busca_cep_store.dart'; // Importa a store de busca de CEP (BuscaCepStore)
import 'consulta_cep/data/repository/cep_repository.dart'; // Importa o repositório de CEP (CepRepository)
import 'consulta_cep/domain/user_case/busca_cep_case.dart'; // Importa o caso de uso de busca de CEP (BuscaCepCase)
import '../shared/dio/use_dio.dart'; // Importa a classe useDio para requisições HTTP

// Define uma classe AppModule que extende Module do Flutter Modular
class AppModule extends Module {
  // Sobrescreve o método binds para registrar dependências
  @override
  void binds(i){
    i.add(useDio.new); // Adiciona a instância de useDio ao container de injeção de dependências
    i.add(CepRepository.new); // Adiciona a instância de CepRepository ao container de injeção de dependências
    i.add(BuscaCepCase.new); // Adiciona a instância de BuscaCepCase ao container de injeção de dependências
    i.add(BuscaCepStore.new); // Adiciona a instância de BuscaCepStore ao container de injeção de dependências
  }

  // Sobrescreve o método routes para definir as rotas do aplicativo
  @override
    void routes(r) {
    r.child('/',child: (_,) =>const HomePage()); // Define a rota para a página inicial (HomePage)
    r.child('/busca_cep',child: (_,) =>const BuscaCepPage()); // Define a rota para a página de busca de CEP (BuscaCepPage)
  }
}