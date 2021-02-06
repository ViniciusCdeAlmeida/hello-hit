import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({Key key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _escolhaUsuario;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RadioListTile(
          activeColor: Colors.white,
          title: Text(
            "Public",
            style: TextStyle(color: Colors.white),
          ),
          value: 1,
          groupValue: _escolhaUsuario,
          onChanged: (int escolha) {
            setState(
              () {
                _escolhaUsuario = escolha;
              },
            );
          },
        ),
        RadioListTile(
          activeColor: Colors.white,
          title: Text(
            "Fans Only",
            style: TextStyle(color: Colors.white),
          ),
          value: 2,
          groupValue: _escolhaUsuario,
          onChanged: (int escolha) {
            setState(() {
              _escolhaUsuario = escolha;
            });
          },
        ),
        RadioListTile(
          activeColor: Colors.white,
          title: Text(
            "Select Tier",
            style: TextStyle(color: Colors.white),
          ),
          value: 3,
          groupValue: _escolhaUsuario,
          onChanged: (int escolha) {
            setState(() {
              _escolhaUsuario = escolha;
            });
          },
        ),
      ],
    );
  }
}
