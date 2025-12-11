import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({required this.resp, required this.txt, super.key});

  final void Function() resp;
  final String txt;

@override
Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: resp,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.deepOrange,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.zero, //
            )
          ),
          child: Text(txt, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}