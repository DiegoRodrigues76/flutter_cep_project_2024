import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote Flutter Modular para modularização do aplicativo
import 'presentation/home_page.dart'; // Importa a página inicial (HomePage)
import '../consulta_cep/presentation/page/busca_cep_page.dart'; // Importa a página de busca de CEP (BuscaCepPage)

// Define uma classe AppModule que extende Module do Flutter Modular
class AppModule extends Module {
  @override
    void routes(r) {
    r.child('/',child: (_,) =>const HomePage()); // Define a rota para a página inicial (HomePage)
    r.child('/busca_cep',child: (_,) =>const BuscaCepPage()); // Define a rota para a página de busca de CEP (BuscaCepPage)
  }
}
