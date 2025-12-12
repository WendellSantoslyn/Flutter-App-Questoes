import 'package:flutter/material.dart';
import 'package:questoes/pergunta_respostas.dart';
import './dados.dart';
import './lista_perguntas.dart';
import './resultado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final dados = perguntasRespostas;
  List respostas = [];
  var indicePergunta = 0;
  var totalPontos = 0;

  @override
  void initState() {
    super.initState();
    perguntasRespostas.shuffle();
  }

  void responder(String r, int ponto) {
    String p = dados[indicePergunta].pergunta;
    respostas.add({"pergunta" : p, "resposta" : r, "ponto" : ponto});
    totalPontos += ponto;
    indicePergunta++;
    setState(() {});
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      totalPontos = 0;
      respostas = [];
      perguntasRespostas.shuffle();
    });
  }

  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wendell", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        toolbarHeight: 80,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [temPergunta
          ? ListaPerguntas(
            indicePergunta: indicePergunta,
            perguntas: dados,
            responder: responder, 
          )
          : Resultado(respostas, reiniciar, totalPontos),
      ]),
    );
  }
}
