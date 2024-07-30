import 'package:sqflite/sqflite.dart'; 
// Importa a biblioteca `sqflite`, que é usada para trabalhar com bancos de dados SQLite em Flutter

class CepDatabase {
  Future<Database> getDatabase() async {
    // Método que retorna uma instância do banco de dados
    // O método é assíncrono,indicando que ele realiza operações que podem demorar, como acessar o sistema de arquivos

    return openDatabase(
      'database.db',
      // Abre ou cria um banco de dados chamado 'database.db'

      version: 1,
      // Especifica a versão do banco de dados
      // Esta informação é importante para gerenciar atualizações no esquema do banco de dados

      onCreate: (Database db, int version) async {
        // Função de callback que é chamada quando o banco de dados é criado pela primeira vez

        await db.execute(
            'CREATE TABLE CEP (cep TEXT PRIMARY KEY, logradouro TEXT, bairro TEXT, localidade TEXT, uf TEXT, ddd TEXT)');
        // Executa uma declaração SQL para criar uma tabela chamada 'CEP'
        // A tabela possui colunas para armazenar informações como 'cep', 'logradouro', 'bairro', 'localidade', 'uf' e 'ddd'
        // A coluna 'cep' é definida como a chave primária.
      },
    );
  }
}
