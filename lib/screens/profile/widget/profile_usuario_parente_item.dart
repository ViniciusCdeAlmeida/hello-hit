import 'package:flutter/material.dart';

class UsuarioParente extends StatelessWidget {
  final String imagem;

  UsuarioParente({
    this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          const Radius.circular(3),
        ),
        child: Image.network(
          imagem,
          height: 10,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
