import 'package:flutter/material.dart';
import './itens.dart';

class Resultado extends StatelessWidget {
  const Resultado(
    this.respostas,
    this.reiniciar,
    this.totalPontos,
    {super.key}
  );

  final List respostas;
  final void Function() reiniciar;
  final int totalPontos;

  @override
  Widget build(BuildContext context) {
    final String mensagem = totalPontos == 10
      ? "Parabéns"
      : totalPontos > 6
      ? "Aprovado"
      : totalPontos > 3
      ? "Recuperação"
      : "Reprovado";

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Respostas",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.from(alpha: 1, red: 180, green: 40, blue: 130)
            ),
          ),
          ...respostas.map((resp) => Itens(
              pergunta: resp['pergunta'],
              resposta: resp['resposta'],
              ponto: resp['ponto'],
            )),
          SizedBox(height: 20),
          Text(
            "$mensagem!\nVocê obteve ${totalPontos.toString()} pontos.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: totalPontos == 10
                ? Colors.greenAccent
                : totalPontos > 6
                ? Colors.blueAccent
                : Colors.red,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: reiniciar,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, double.minPositive),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
              ),
            ),
            child: Text("Reiniciar", style: TextStyle(fontSize: 25)),
          )
        ],
      ),
    );
  }
}