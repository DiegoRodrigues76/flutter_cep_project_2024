// Define a classe CepModel
class CepModel {
  // Declaração dos campos da classe, todos são finais (imutáveis) e do tipo String
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  // Construtor da classe CepModel, requerendo que todos os campos sejam preenchidos
  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  // Factory constructor que cria uma instância de CepModel a partir de um Map (JSON)
  factory CepModel.fromJson(Map<String, dynamic> json) {
    // Retorna uma nova instância de CepModel com os valores do JSON
    // Se algum campo estiver ausente no JSON, ele será preenchido com uma string vazia ('')
    return CepModel(
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      ddd: json['ddd'] ?? '',
    );
  }
}
