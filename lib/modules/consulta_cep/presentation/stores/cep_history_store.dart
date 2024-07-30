import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
// Importa o modelo de dados para o CEP, que provavelmente define a estrutura dos dados de CEP

import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';
// Importa o caso de uso `CepHistoryCase`, que contém a lógica para manipulação do histórico de CEPs

class CepHistoryStore {
  // Define a classe `CepHistoryStore`, que gerencia o estado relacionado ao histórico de CEPs

  final CepHistoryCase _cepHistoryCase;
  // Declara uma variável final `_cepHistoryCase` do tipo `CepHistoryCase`
  // Esta é uma instância do user case que a store vai utilizar para operar sobre os dados.

  CepHistoryStore(this._cepHistoryCase);
  // Construtor da classe, que recebe uma instância de `CepHistoryCase` e a atribui à variável `_cepHistoryCase`

  Future<void> addToDatabase(Map<String, Object> cepData) {
    return _cepHistoryCase.addToDatabase(cepData);
    // Método para adicionar dados de CEP ao banco de dados
    // Ele delega a operação ao método `addToDatabase` de `CepHistoryCase`.
  }

  Future<CepModel> getFromDatabase(String cep) {
    return _cepHistoryCase.getFromDatabase(cep);
    // Método para obter um CEP específico do banco de dados, usando o método `getFromDatabase` de `CepHistoryCase`
  }

  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepHistoryCase.getCeps();
    // Método para obter a lista de todos os CEPs armazenados, delegando a operação ao método `getCeps` de `CepHistoryCase`
  }

  Future<void> deleteCep(String cep) {
    return _cepHistoryCase.deleteCep(cep);
    // Método para deletar um CEP específico do banco de dados, usando o método `deleteCep` de `CepHistoryCase`
  }
}
