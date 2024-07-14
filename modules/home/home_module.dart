import 'package:flutter_modular/flutter_modular.dart';  // Biblioteca Flutter Modular para injeção de dependências e gerenciamento de rotas
import 'presentation/home_page.dart';  // Importa a página inicial (HomePage) do diretório presentation
import '../consulta_cep/presentation/busca_cep_page.dart';  // Importa a página de busca de CEP (BuscaCepPage) do diretório consulta_cep/presentation

// Classe AppModule: Define o módulo principal do aplicativo usando Flutter Modular
class AppModule extends Module {
  @override
    void routes(r) {
    r.child('/',child: (_,) =>const HomePage()); // Define a rota raiz '/' que exibe a HomePage
    r.child('/busca_cep',child: (_,) =>const BuscaCepPage()); // Define a rota '/busca_cep' que exibe a BuscaCepPage
  }
}
