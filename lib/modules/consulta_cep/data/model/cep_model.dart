class CepModel {
  final String logradouro; // Atributo que armazena o nome da rua ou avenida
  final String bairro;     // Atributo que armazena o nome do bairro
  final String localidade; // Atributo que armazena a cidade ou município
  final String uf;         // Atributo que armazena a sigla do estado (Unidade Federativa)
  final String ddd;        // Atributo que armazena o código de área (DDD) da localidade

  // Construtor da classe CepModel que inicializa os atributos com os valores fornecidos.
  // Todos os atributos são obrigatórios (required)
  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  // Factory constructor que cria uma instância de CepModel a partir de um mapa JSON
  // O mapa JSON contém chaves do tipo String e valores do tipo dynamic
  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      logradouro: json['logradouro'] ?? '', // Atribui o valor do campo 'logradouro' ou uma string vazia se não estiver presente
      bairro: json['bairro'] ?? '',         // Atribui o valor do campo 'bairro' ou uma string vazia se não estiver presente
      localidade: json['localidade'] ?? '', // Atribui o valor do campo 'localidade' ou uma string vazia se não estiver presente
      uf: json['uf'] ?? '',                 // Atribui o valor do campo 'uf' ou uma string vazia se não estiver presente
      ddd: json['ddd'] ?? '',               // Atribui o valor do campo 'ddd' ou uma string vazia se não estiver presente
    );
  }
}
