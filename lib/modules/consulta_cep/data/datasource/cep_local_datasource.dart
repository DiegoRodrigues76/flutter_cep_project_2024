import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart'; // Importa o modelo CepModel
import 'package:estudo_flutter/shared/database/database.dart'; // Importa a classe CepDatabase para interação com o banco de dados
import 'package:sqflite/sqflite.dart'; // Importa a biblioteca sqflite para manipulação de banco de dados SQLite

abstract class CepLocalDatasourceInterface {
  Future<void> addToDatabase(Map<String, dynamic> cepData); // Declara um método assíncrono para adicionar dados de CEP ao banco de dados
  Future<CepModel> getFromDatabase(String cep); // Declara um método assíncrono para obter dados de um CEP específico do banco de dados
  Future<List<Map<String, dynamic>>> getCeps(); // Declara um método assíncrono para obter todos os CEPs armazenados no banco de dados
  Future<void> deleteCep(String cep); // Declara um método assíncrono para deletar um CEP específico do banco de dados
}

class CepLocalDatasource extends CepLocalDatasourceInterface {
  CepDatabase cepDatabase = CepDatabase(); // Instancia a classe CepDatabase para gerenciar a conexão com o banco de dados

  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) async {
    final db = await cepDatabase.getDatabase(); // Obtém a instância do banco de dados
    await db.insert(
      'CEP', // Nome da tabela onde os dados serão inseridos
      cepData, // Dados do CEP a serem inseridos
      conflictAlgorithm: ConflictAlgorithm.replace, // Define o algoritmo de conflito para substituir registros existentes com o mesmo ID
    );
  }

  @override
  Future<CepModel> getFromDatabase(String cep) async {
    final db = await cepDatabase.getDatabase(); // Obtém a instância do banco de dados
    final List<Map<String, dynamic>> cepData = await db.query(
      'CEP', // Nome da tabela.
      where: 'cep = ?', // Condição de consulta para encontrar o CEP específico
      whereArgs: [cep], // Argumentos da condição de consulta.
    );
    CepModel cepModel = CepModel.fromJson(cepData.first); // Converte o primeiro resultado da consulta para um objeto CepModel
    return cepModel; // Retorna o objeto CepModel
  }

  @override
  Future<List<Map<String, dynamic>>> getCeps() async {
    final db = await cepDatabase.getDatabase(); // Obtém a instância do banco de dados
    return await db.query('CEP'); // Consulta todos os registros na tabela 'CEP' e retorna a lista de mapas com os dados
  }

  @override
  Future<void> deleteCep(String cep) async {
    final db = await cepDatabase.getDatabase(); // Obtém a instância do banco de dados
    await db.delete(
      'CEP', // Nome da tabela onde o registro será deletado
      where: 'cep = ?', // Condição de deleção para encontrar o CEP específico
      whereArgs: [cep], // Argumentos da condição de deleção
    );
  }
}
