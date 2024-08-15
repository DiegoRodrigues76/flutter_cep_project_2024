import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/use_cases/cep_history_case.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:estudo_flutter/modules/home/home_module.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'consulta_cep/presentation/stores/busca_cep_store.dart';
import 'consulta_cep/data/repository/cep_repository.dart';
import 'consulta_cep/domain/use_cases/busca_cep_case.dart';
import '../shared/dio/use_dio.dart';
import '../shared/mobx/loading_store.dart';

// Módulo principal do aplicativo
class AppModule extends Module {
  @override
  void binds(i) {
    // Registra as dependências do módulo
    i.add(LoadingStore.new); // Adiciona a loja de carregamento
    i.add(CepDatabase.new); // Adiciona a instância do banco de dados de CEP
    i.add(UseDio.new); // Adiciona a instância do cliente Dio para requisições HTTP

    // Registra as dependências para o datasource local de CEP
    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);
    // Registra as dependências para o datasource remoto de CEP
    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);

    // Registra os repositórios de CEP
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);

    // Registra os casos de uso e lojas relacionadas ao CEP
    i.add(BuscaCepCase.new);
    i.add(BuscaCepStore.new);
    i.add(CepHistoryStore.new);
    i.add(CepHistoryCase.new);
  }

  @override
  void routes(r) {
    // Define as rotas para os módulos Home e Consulta de CEP
    r.module('/', module: HomeModule());
    r.module('/busca_cep/', module: ConsultaCepModule());
  }
}
