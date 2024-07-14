// Classe CepModel: Representa o modelo de dados para informações de CEP
class CepModel {
  final String logradouro;  // Atributo para armazenar o logradouro do endereço correspondente ao CEP
  final String bairro;  // Atributo para armazenar o bairro do endereço correspondente ao CEP
  final String localidade;  // Atributo para armazenar a localidade (cidade) do endereço correspondente ao CEP
  final String uf;  // Atributo para armazenar a UF (estado) do endereço correspondente ao CEP
  final String ddd;  // Atributo para armazenar o DDD da localidade do endereço correspondente ao CEP

  // Construtor da classe CepModel, com parâmetros obrigatórios utilizando 'required'
  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  // Factory method 'fromJson' para criar uma instância de CepModel a partir de um mapa JSON
  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      logradouro: json['logradouro'] ?? '',  // Atribui o valor do campo 'logradouro' do JSON ao atributo 'logradouro' da classe. Se o valor for nulo, atribui uma string vazia
      bairro: json['bairro'] ?? '',  // Atribui o valor do campo 'bairro' do JSON ao atributo 'bairro' da classe. Se o valor for nulo, atribui uma string vazia
      localidade: json['localidade'] ?? '',  // Atribui o valor do campo 'localidade' do JSON ao atributo 'localidade' da classe. Se o valor for nulo, atribui uma string vazia
      uf: json['uf'] ?? '',  // Atribui o valor do campo 'uf' do JSON ao atributo 'uf' da classe. Se o valor for nulo, atribui uma string vazia
      ddd: json['ddd'] ?? '',  // Atribui o valor do campo 'ddd' do JSON ao atributo 'ddd' da classe. Se o valor for nulo, atribui uma string vazia
    );
  }
}
