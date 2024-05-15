import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class MyHomeScreen extends StatefulWidget{
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<MyHomeScreen> {
  bool loading = true;
  final String userURL = "https://jsonplaceholder.typicode.com/users";
  List<UserModel> userData = [];

  @override
  void initState() {
    fetchData();
    super.initState();
}

  Future<void> fetchData() async{
    http.Response response = await http.get(Uri.parse(userURL));
    if (response.statusCode == 200) {
      List responseData = jsonDecode(response.body);
      responseData
          .map((json) => userData.add(UserModel.fromJson(json)))
          .toList();
      setState(() {
        loading = false;
        });
    } else {
      throw Exception("Algo deu errado, ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Serialization"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: loading
            //ignore: avoid_unecessary_containers
            ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
          ),
      )
      : ListView.builder(
          itemCount: userData.length,
          itemBuilder: (BuildContext context, index) {
            var address = userData[index].address.toString();
            var name = userData[index].name;
            var company = userData[index].company.toString();
            return Card (
              child: ListTile(
                title: Text(address),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                  ),
                  child: Text(name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),)),
                  subtitle: Text(company),
              ),
            );
          })),
    );
  }
}