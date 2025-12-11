import 'package:flutter/material.dart';
import 'botoes.dart';

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
  final perguntas = [
    {
    "pergunta" : "1. Qual a sua cor favorita?",
    "resposta" : ["verde", "amarelo", "azul", "vermelho", "roxo"]
    },
    {
    "pergunta" : "2. Qual o seu animal favorito?",
    "resposta" : ["Garfield", "lasanha do Garfield", "humano do Garfield", "cachorro amigo do Garfield", "galo"]
    },
    {
    "pergunta" : "3. Qual é o seu time?",
    "resposta" : ["Josefense", "Flamengo do Piauí", "Capivariano", "Corinthians Alagoano", "SER Panambi"]
    }
  ];

  var indicePergunta = 0;

  void responder() {
    if (indicePergunta < perguntas.length - 1) {
      indicePergunta++;
    } else {
      indicePergunta = 0;
    } setState(() {
      
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              perguntas[indicePergunta]["pergunta"].toString(),
              style: TextStyle(fontSize: 30)
            ),
            SizedBox(height: 20,),
            ...((perguntas[indicePergunta]['resposta'] as List<String>)
            .map((textoBotao) => Botoes(resp: responder, txt: textoBotao))
            .toList()),
          ],
         ),
       ),
    );
  }
}
