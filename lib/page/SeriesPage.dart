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

  _buscarSeries() async {
    var texto = (await Services().getSeries())!;
    setState(() {
      text = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serie"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            ElevatedButton(
              onPressed: () => _buscarSeries(),
              child: const Text(
                'Buscar Serie',
              ),
            )
          ],
        ),
      ),
    );
  }
}
