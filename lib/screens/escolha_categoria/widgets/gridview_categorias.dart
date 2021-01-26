import 'package:flutter/material.dart';
import 'package:hellohit/models/gridviewcategorias_model.dart';

class GridViewCategorias extends StatelessWidget {
  final int index;

  GridViewCategorias(this.index);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(categoriasList[index].imageUrl),
        ),
      ],
    );
  }
}
