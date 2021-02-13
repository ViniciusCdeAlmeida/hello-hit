import 'package:flutter/material.dart';

class UsuarioSkills extends StatelessWidget {
  final String skill;

  UsuarioSkills({
    this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1,
          color: Colors.grey[500],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(skill),
      ),
    );
  }
}
