import 'package:sqflite/sqflite.dart';

// Classe para gerenciar o banco de dados de CEP
class CepDatabase {
  // Método para obter a instância do banco de dados
  Future<Database> getDatabase() async {
    return openDatabase(
      'database.db', // Nome do arquivo do banco de dados
      version: 1, // Versão do banco de dados
      onCreate: (Database db, int version) async {
        // Criação da tabela CEP quando o banco de dados é criado pela primeira vez
        await db.execute(
            'CREATE TABLE CEP (cep TEXT PRIMARY KEY, logradouro TEXT, bairro TEXT, localidade TEXT, uf TEXT, ddd TEXT)');
      },
    );
  }
}
