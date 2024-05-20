import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _cepController = TextEditingController();
  String _result = "Resultado: ";

  void _consultarCEP() async {
    String cep = _cepController.text;
    String url = "https://viacep.com.br/ws/$cep/json/";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _result = "Resultado: ${data['logradouro']}, ${data['bairro']}, ${data['localidade']}, ${data['uf']}";
        });
      } else {
        setState(() {
          _result = "Erro: não foi possível consultar o CEP.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Erro: $e";
      });
    }
  }

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
                labelText: "Digite o CEP exemplo: 1833400",
              ),
              style: TextStyle(fontSize: 15),
            ),
            Text(
              _result,
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text(
                "Consultar",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _consultarCEP,
            ),
          ],
        ),
      ),
    );
  }
}
