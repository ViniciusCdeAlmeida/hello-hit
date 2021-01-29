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
          margin: EdgeInsets.all(20),
          width: width / 1.2,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
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
        Text(titulo),
      ],
    );
  }
}
