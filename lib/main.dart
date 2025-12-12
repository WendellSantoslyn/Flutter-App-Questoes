import 'package:flutter/material.dart';
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

  void responder(String r) {
    String p = dados[indicePergunta].pergunta;
    respostas.add({"pergunta" : p, "resposta" : r});
    indicePergunta++;
    setState(() {});
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      respostas = [];
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: temPergunta
          ? ListaPerguntas(
            indicePergunta: indicePergunta,
            perguntas: dados,
            responder: responder, 
          )
          : Resultado(respostas, reiniciar),
      ),
    );
  }
}
