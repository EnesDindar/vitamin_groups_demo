import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vitamin_groups_demo/models/vitamin.dart';
import 'package:vitamin_groups_demo/screens/detailPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<List<vitamin>> _loadData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    return jsonResponse.map((v) => vitamin.fromJson(v)).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Vitamin Groups',
                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
            elevation: 20,
            centerTitle: true,
            backgroundColor: Colors.white),
        body: _createBody());
  }

  Widget _createBody() {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(data.length, (index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailPage(data: data[index])));
              },
              child: _vitaminCard("${_loadData().then((value) => 0)}", "${data[index]["photo"]}"));
        }));
  }

  Widget _vitaminCard(String title, String photo) {
    return Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Stack(fit: StackFit.expand, children: [
          Image.network(
            '$photo',
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 10,
              bottom: 10,
              child: Text("$title",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10.0, color: Colors.black, offset: Offset(5.0, 5.0))])))
        ]));
  }
}
