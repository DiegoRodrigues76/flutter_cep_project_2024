class CepModel {
  // Definição dos atributos da classe
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  // Construtor da classe que inicializa todos os atributos
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  // Factory method que cria uma instância de CepModel a partir de um JSON
  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      // Atribui os valores do JSON aos atributos da classe, utilizando valores padrão vazios caso alguma chave não exista
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      ddd: json['ddd'] ?? '',
    );
  }
}
