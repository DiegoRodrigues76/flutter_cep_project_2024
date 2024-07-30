import '../../domain/user_case/busca_cep_case.dart';
// Importa o user case `BuscaCepCase`, que contém a lógica de busca de CEP

import '../../data/model/cep_model.dart';
// Importa o modelo de dados `CepModel`, que define a estrutura dos dados de um CEP

class BuscaCepStore {
  // Define a classe `BuscaCepStore`, que gerencia o estado relacionado à busca de CEPs

  final BuscaCepCase _buscaCepCase;
  // Declara uma variável final `_buscaCepCase` do tipo `BuscaCepCase`

  BuscaCepStore(this._buscaCepCase);
  // Construtor da classe, que recebe uma instância de `BuscaCepCase` e a atribui à variável `_buscaCepCase`

  Future<String> getText(String cep) async {
    // Método que recebe um CEP como argumento e retorna uma string formatada com informações do CEP

    final CepModel cepModel = await _buscaCepCase.getCep(cep);
    // Chama o método `getCep` de `BuscaCepCase` para buscar os dados do CEP, retornando uma instância de `CepModel`

    final cepData = {
      'cep': cep,
      'logradouro': cepModel.logradouro,
      'bairro': cepModel.bairro,
      'localidade': cepModel.localidade,
      'uf': cepModel.uf,
      'ddd': cepModel.ddd,
    };
    // Cria um mapa `cepData` com as informações do CEP obtidas

    _buscaCepCase.addToDatabase(cepData);
    // Adiciona os dados do CEP ao banco de dados chamando o método `addToDatabase` de `BuscaCepCase`

    return 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
    // Retorna uma string formatada contendo as informações do CEP
  }
}
