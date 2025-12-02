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
    "1. Qual a sua cor favorita?",
    "2. Qual o seu animal favorito?",
    "3. Qual é o seu time?"
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
        title: const Text("Wendell", style: TextStyle(fontSize: 30)),
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
              perguntas[indicePergunta],
              style: TextStyle(fontSize: 30)
            ),
            Botoes(resp: responder),
            Botoes(resp: responder),
            Botoes(resp: responder)
          ],
         ),
       ),
    );
  }
}
