import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marvelapp/service/Services.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  String text = "";

  bool loading = true;

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  _buscarSeries() async {
    var texto = (await Services().getSeries())!;
    setState(() {
      text = texto;
    });
  }

  Widget personagemComponent(String titulo, String sinopse, String imagem) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
            child: Image.asset('assets/moluconto.png'),
          ),
          const Text("Título"),
          const Text("Sinopse")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Serie"),
        ),
        body: _listSeries(loading));
  }

  Widget _listSeries(bool l) {
    if (l) {
      return const Center(
             child: CircularProgressIndicator(),
        );
    } else {
      return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100.0,
            color: colors[index],
            child: Center(
              child: Text(
                'Container $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
