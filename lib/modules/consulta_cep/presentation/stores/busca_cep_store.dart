import '../../domain/use_cases/busca_cep_case.dart';
import '../../data/model/cep_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// A classe BuscaCepStore serve como uma camada de interface para o uso dos casos de uso de busca de CEP
class BuscaCepStore {
  final BuscaCepCase _buscaCepCase; // Instância do caso de uso BuscaCepCase
  BuscaCepStore(this._buscaCepCase); // Construtor que inicializa a instância de BuscaCepCase

  // Método para obter o texto formatado de um CEP
  Future<String> getText(cep) async {
    final CepModel cepModel = await _buscaCepCase.getCep(cep); // Obtém o modelo de CEP a partir do caso de uso
    final cepData = {
      'cep': cep,
      'logradouro': cepModel.logradouro,
      'bairro': cepModel.bairro,
      'localidade': cepModel.localidade,
      'uf': cepModel.uf,
      'ddd': cepModel.ddd,
    };
    _buscaCepCase.addToDatabase(cepData); // Adiciona os dados do CEP ao banco de dados
    return 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}'; // Retorna os dados formatados
  }

  // Método para obter uma lista de textos formatados de CEPs
  Future<List<String>> getList(cep) async {
    final List<CepModel> cepModel = await _buscaCepCase.getCepList(cep); // Obtém a lista de modelos de CEP a partir do caso de uso
    List<String> cepDataList = [];
    for (var cep in cepModel) {
      final cepData = {
        'cep': cep.cep,
        'logradouro': cep.logradouro,
        'bairro': cep.bairro,
        'localidade': cep.localidade,
        'uf': cep.uf,
        'ddd': cep.ddd,
      };
      cepDataList.add('CEP: ${cep.cep}\nLogradouro: ${cep.logradouro}\nBairro: ${cep.bairro}\nLocalidade: ${cep.localidade}\nUF: ${cep.uf}\nDDD: ${cep.ddd}\n\n'); // Adiciona os dados formatados à lista
      _buscaCepCase.addToDatabase(cepData); // Adiciona os dados do CEP ao banco de dados
    }
    return cepDataList; // Retorna a lista de dados formatados
  }

  // Método para carregar estados e cidades a partir de um arquivo JSON
  Future<List<Estado>> carregarEstadosCidades() async {
    String response = await rootBundle.loadString('lib/shared/assets/data/estados_cidades.json'); // Carrega o conteúdo do arquivo JSON
    var data = json.decode(response); // Decodifica o JSON
    List<Estado> estados = (data['estados'] as List).map((i) => Estado.fromJson(i)).toList(); // Converte os dados do JSON para uma lista de objetos Estado
    return estados; // Retorna a lista de estados
  }
}

// Classe que representa um Estado com sua sigla, nome e lista de cidades
class Estado {
  final String sigla; // Sigla do estado
  final String nome; // Nome do estado
  final List<String> cidades; // Lista de cidades do estado

  Estado({required this.sigla, required this.nome, required this.cidades}); // Construtor da classe Estado

  // Método fábrica que cria um objeto Estado a partir de um JSON
  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      sigla: json['sigla'],
      nome: json['nome'],
      cidades: List<String>.from(json['cidades']), // Converte a lista de cidades do JSON para uma lista de strings
    );
  }
}
