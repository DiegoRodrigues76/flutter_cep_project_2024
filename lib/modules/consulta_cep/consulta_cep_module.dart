import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
// Importa o datasource local para CEP, responsável por buscar dados localmente

import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
// Importa o datasource remoto para CEP, responsável por buscar dados de uma fonte externa

import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
// Importa o repositório do banco de dados de CEP, que gerencia operações no banco de dados local

import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_repository.dart';
// Importa o repositório de CEP, que gerencia a lógica de acesso a dados de CEP

import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
// Importa a interface do repositório do banco de dados de CEP

import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
// Importa a interface do repositório de CEP

import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';
// Importa o caso de uso para o histórico de CEP

import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_cep_page.dart';
// Importa a página de busca de CEP

import 'package:estudo_flutter/modules/consulta_cep/presentation/page/cep_history_page.dart';
// Importa a página do histórico de CEP

import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
// Importa a store para gerenciar o estado da busca de CEP

import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
// Importa a store para gerenciar o estado do histórico de CEP

import 'package:estudo_flutter/shared/database/database.dart';
// Importa o banco de dados compartilhado

import 'package:flutter_modular/flutter_modular.dart';
// Importa o Flutter Modular para gerenciamento de dependências e rotas

import 'domain/user_case/busca_cep_case.dart';
// Importa o caso de uso para busca de CEP

import '../../shared/dio/use_dio.dart';
// Importa o uso do Dio, um cliente HTTP para fazer requisições

class ConsultaCepModule extends Module {
  @override
  void binds(i) {
    // O método `binds` é usado para registrar as dependências que podem ser injetadas em outras partes do aplicativo

    i.addLazySingleton(UseDio.new);
    // Registra `UseDio` como uma instância LazySingleton

    i.addLazySingleton(CepDatabase.new);
    // Registra `CepDatabase` como uma instância LazySingleton

    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);
    // Registra `CepLocalDatasource` como uma implementação LazySingleton de `CepLocalDatasourceInterface`.

    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);
    // Registra `CepRemoteDatasource` como uma implementação LazySingleton de `CepRemoteDatasourceInterface`.

    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    // Registra `CepRepository` como uma implementação LazySingleton de `CepRepositoryInterface`.

    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);
    // Registra `CepDbRepository` como uma implementação LazySingleton de `CepDbRepositoryInterface`.

    i.addLazySingleton(BuscaCepCase.new);
    // Registra `BuscaCepCase` como uma instância LazySingleton

    i.addLazySingleton(BuscaCepStore.new);
    // Registra `BuscaCepStore` como uma instância LazySingleton

    i.addLazySingleton(CepHistoryStore.new);
    // Registra `CepHistoryStore` como uma instância LazySingleton

    i.addLazySingleton(CepHistoryCase.new);
    // Registra `CepHistoryCase` como uma instância LazySingleton
  }

  @override
  void routes(r) {
    // O método `routes` define as rotas do módulo

    r.child('/', child: (context) => BuscaCepPage());
    // Define a rota raiz ('/') que carrega a `BuscaCepPage`

    r.child('/history', child: (context) => CepHistoryPage());
    // Define a rota '/history' que carrega a `CepHistoryPage`
  }
}
