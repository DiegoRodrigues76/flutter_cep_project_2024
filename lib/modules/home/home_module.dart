import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/home_page.dart';

// Módulo principal que gerencia as rotas iniciais do aplicativo
class HomeModule extends Module {
  // Sobrescreve o método 'routes' para definir as rotas deste módulo
  @override
  void routes(r) {
    // Define a rota inicial que carrega a HomePage
    r.child('/', child: (context) => HomePage());

    // Define uma sub-rota que carrega o módulo de consulta de CEPs
    r.module('/busca_cep/', module: ConsultaCepModule());
  }
}
