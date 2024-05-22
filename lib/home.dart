import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'home.g.dart'; // Certifique-se de que o nome do arquivo é todo em minúsculas

// Store para gerenciar o estado
class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  @observable
  String result = "Resultado: ";

  @action
  Future<void> consultarCEP(String cep) async {
    String url = "https://viacep.com.br/ws/$cep/json/";

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        if (data.containsKey('erro')) {
          result = "Erro: CEP não encontrado.";
        } else {
          result = "Resultado: ${data['logradouro']}, ${data['bairro']}, ${data['localidade']}, ${data['uf']}";
        }
      } else {
        result = "Erro: não foi possível consultar o CEP.";
      }
    } catch (e) {
      result = "Erro: $e";
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _cepController = TextEditingController();
  final CepStore _cepStore = CepStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultando um CEP via API'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP exemplo: 01001000",
              ),
              style: TextStyle(fontSize: 15),
            ),
            Observer(
              builder: (_) => Text(
                _cepStore.result,
                style: TextStyle(fontSize: 25),
              ),
            ),
            ElevatedButton(
              child: Text(
                "Consultar",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => _cepStore.consultarCEP(_cepController.text),
            ),
          ],
        ),
      ),
    );
  }
}
