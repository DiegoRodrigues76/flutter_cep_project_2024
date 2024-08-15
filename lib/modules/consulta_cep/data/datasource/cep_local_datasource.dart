import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:sqflite/sqflite.dart';

// Interface que define os métodos para o datasource local de CEP
abstract class CepLocalDatasourceInterface {
  Future<void> addToDatabase(Map<String, dynamic> cepData); // Adiciona dados ao banco de dados
  Future<CepModel> getFromDatabase(String cep); // Obtém um CEP específico do banco de dados
  Future<List<Map<String, dynamic>>> getCeps(); // Obtém todos os CEPs do banco de dados
  Future<void> deleteCep(String cep); // Deleta um CEP específico do banco de dados
}

// Implementação da interface do datasource local de CEP
class CepLocalDatasource extends CepLocalDatasourceInterface {
  // Instância da classe CepDatabase para gerenciar o banco de dados
  CepDatabase cepDatabase = CepDatabase();
  
  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) async {
    // Obtém uma instância do banco de dados
    final db = await cepDatabase.getDatabase();
    // Insere os dados no banco de dados, substituindo qualquer conflito
    await db.insert(
      'CEP',
      cepData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<CepModel> getFromDatabase(String cep) async {
    // Obtém uma instância do banco de dados
    final db = await cepDatabase.getDatabase();
    // Consulta o banco de dados para encontrar o CEP específico
    final List<Map<String, dynamic>> cepData =
        await db.query('CEP', where: 'cep = ?', whereArgs: [cep]);
    // Cria um CepModel a partir dos dados obtidos
    CepModel cepModel = cepData.removeAt(0) as CepModel;
    return cepModel;
  }

  @override
  Future<List<Map<String, dynamic>>> getCeps() async {
    // Obtém uma instância do banco de dados
    final db = await cepDatabase.getDatabase();
    // Consulta o banco de dados para obter todos os CEPs
    return await db.query('CEP');
  }

  @override
  Future<void> deleteCep(String cep) async {
    // Obtém uma instância do banco de dados
    final db = await cepDatabase.getDatabase();
    // Deleta o CEP específico do banco de dados
    await db.delete('CEP', where: 'cep = ?', whereArgs: [cep]);
  }
}
