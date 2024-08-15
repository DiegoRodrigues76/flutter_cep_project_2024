import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/use_cases/cep_history_case.dart';

// A classe CepHistoryStore serve como uma camada de interface para o uso dos casos de uso de histórico de CEP
class CepHistoryStore {
  // Instância do caso de uso CepHistoryCase que encapsula a lógica de negócios relacionada ao histórico de CEPs
  final CepHistoryCase _cepHistoryCase;

  // Construtor que inicializa o CepHistoryStore com uma instância de CepHistoryCase
  CepHistoryStore(this._cepHistoryCase);

  // Método para adicionar um novo CEP ao banco de dados
  // Recebe um mapa de dados do CEP e chama o método addToDatabase do caso de uso
  Future<void> addToDatabase(Map<String, Object> cepData) {
    return _cepHistoryCase.addToDatabase(cepData);
  }

  // Método para obter um CEP específico do banco de dados
  // Recebe um CEP como string e chama o método getFromDatabase do caso de uso
  Future<CepModel> getFromDatabase(String cep) {
    return _cepHistoryCase.getFromDatabase(cep);
  }

  // Método para obter a lista de todos os CEPs do banco de dados
  // Chama o método getCeps do caso de uso
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepHistoryCase.getCeps();
  }

  // Método para deletar um CEP específico do banco de dados
  // Recebe um CEP como string e chama o método deleteCep do caso de uso
  Future<void> deleteCep(String cep) {
    return _cepHistoryCase.deleteCep(cep);
  }
}
