import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String titulo;

  CustomAppBar(this.titulo);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.titulo),
    );
  }
}
