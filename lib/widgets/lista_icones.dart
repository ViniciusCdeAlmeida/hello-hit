import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  const IconRow({
    Key key,
    this.texto,
    this.icon,
    this.height,
    this.width,
    this.titulo,
  }) : super(key: key);

  final String texto;
  final String titulo;
  final IconData icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: width / 1.2,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (texto != null) Text(texto),
              Icon(
                icon,
                color: Colors.orange[900],
              ),
            ],
          ),
        ),
        Container(
          // width: 70,
          child: Text(titulo),
        ),
      ],
    );
  }
}
