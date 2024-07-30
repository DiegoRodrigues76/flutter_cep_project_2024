import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
// Importa o módulo `ConsultaCepModule`, que contêm funcionalidades relacionadas à busca de CEP

import 'package:flutter_modular/flutter_modular.dart';
// Importa o pacote Flutter Modular para modularização do aplicativo

import 'presentation/home_page.dart';
// Importa a classe `HomePage`, que é a tela inicial do módulo `HomeModule`

class HomeModule extends Module {
  // Define uma classe `HomeModule` que estende `Module`

  @override
  void routes(r) {
    // O método `routes` define as rotas que pertencem a este módulo

    r.child('/', child: (context) => HomePage());
    // Define uma rota para o caminho raiz ('/') que carrega a `HomePage`

    r.module('/busca_cep/', module: ConsultaCepModule());
    // Define uma rota '/busca_cep/' que carrega o módulo `ConsultaCepModule`
  }
}
