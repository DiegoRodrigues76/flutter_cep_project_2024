import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/use_cases/cep_history_case.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_cep_page.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_endereco_page.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/cep_history_page.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/use_cases/busca_cep_case.dart';
import '../../shared/dio/use_dio.dart';

// Definindo o módulo ConsultaCepModule
class ConsultaCepModule extends Module {
  @override
  void binds(i) {
    // Registrando os singletons necessários para o módulo
    i.addLazySingleton(UseDio.new);  // Adiciona o singleton UseDio para gerenciamento de requisições HTTP
    i.addLazySingleton(CepDatabase.new);  // Adiciona o singleton CepDatabase para gerenciamento do banco de dados local
    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);  // Adiciona o singleton CepLocalDatasource como implementação da interface CepLocalDatasourceInterface
    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);  // Adiciona o singleton CepRemoteDatasource como implementação da interface CepRemoteDatasourceInterface
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);  // Adiciona o singleton CepRepository como implementação da interface CepRepositoryInterface
    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);  // Adiciona o singleton CepDbRepository como implementação da interface CepDbRepositoryInterface
    i.addLazySingleton(BuscaCepCase.new);  // Adiciona o singleton BuscaCepCase para lógica de casos de uso relacionados ao CEP
    i.addLazySingleton(BuscaCepStore.new);  // Adiciona o singleton BuscaCepStore para gerenciamento de estado relacionado à busca de CEP
    i.addLazySingleton(CepHistoryStore.new);  // Adiciona o singleton CepHistoryStore para gerenciamento do histórico de CEPs
    i.addLazySingleton(CepHistoryCase.new);  // Adiciona o singleton CepHistoryCase para lógica de casos de uso relacionados ao histórico de CEP
  }

  @override
  void routes(r) {
    // Definindo as rotas do módulo
    r.child('/', child: (context) => const BuscaCepPage());  // Rota para a página de busca de CEP
    r.child('/history', child: (context) => const CepHistoryPage());  // Rota para a página de histórico de CEPs
    r.child('/endereco', child: (context) => const BuscaEnderecoPage());  // Rota para a página de busca de endereços
  }
}
