import 'dart:ui';

import 'package:flutter/material.dart';

class TimeOportunidades extends StatelessWidget {
  final String imagem;
  final String nome;

  TimeOportunidades({
    Key key,
    this.imagem,
    this.nome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                const Radius.circular(3),
              ),
              child: Container(
                height: 50,
                child: Image.network(
                  imagem,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    nome,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
