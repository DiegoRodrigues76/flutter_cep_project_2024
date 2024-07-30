import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:estudo_flutter/modules/home/home_module.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'consulta_cep/presentation/stores/busca_cep_store.dart';
import 'consulta_cep/data/repository/cep_repository.dart';
import 'consulta_cep/domain/user_case/busca_cep_case.dart';
import '../shared/dio/use_dio.dart';
import '../shared/mobx/loading_store.dart';

// As importações trazem módulos, data sources, repositories, user cases e stores

class AppModule extends Module {
  // A classe `AppModule` estende `Module`

  @override
  void binds(i){
    // O método `binds` registra as dependências que podem ser injetadas em outras partes da aplicação
    
    i.add(LoadingStore.new);
    // Registra `LoadingStore`, que gerencia estados de carregamento

    i.add(CepDatabase.new);
    // Registra `CepDatabase`, que gerencia o banco de dados local

    i.add(UseDio.new);
    // Registra `UseDio`, que é usado para fazer requisições HTTP com o Dio

    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);
    // Registra `CepLocalDatasource` como uma implementação da interface `CepLocalDatasourceInterface`, utilizando LazySingleton

    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);
    // Registra `CepRemoteDatasource` como uma implementação de `CepRemoteDatasourceInterface`, utilizando o LazySingleton

    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    // Registra `CepRepository` como a implementação de `CepRepositoryInterface`, utilizando LazySingleton

    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);
    // Registra `CepDbRepository` como a implementação de `CepDbRepositoryInterface`, utilizando LazySingleton

    i.add(BuscaCepCase.new);
    // Registra `BuscaCepCase`, um user case para buscar informações de CEP

    i.add(BuscaCepStore.new);
    // Registra `BuscaCepStore`, que gerencia o estado relacionado à busca de CEP

    i.add(CepHistoryStore.new);
    // Registra `CepHistoryStore`, que gerencia o histórico de buscas de CEP

    i.add(CepHistoryCase.new);
    // Registra `CepHistoryCase`, um caso de uso relacionado ao histórico de CEP
  }

  @override
  void routes(r) {
    // O método `routes` define as rotas da aplicação

    r.module('/',module: HomeModule());
    // Define que a rota raiz '/' utiliza o módulo `HomeModule`

    r.module('/busca_cep/',module: ConsultaCepModule());
    // Define que a rota '/busca_cep/' utiliza o módulo `ConsultaCepModule`
  }
}
