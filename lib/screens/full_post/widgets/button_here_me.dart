import 'package:flutter/material.dart';

class ButtonHereMeFullPost extends StatelessWidget {
  const ButtonHereMeFullPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          child: const Text('Here me'),
          padding: EdgeInsets.fromLTRB(135, 10, 135, 10),
          textColor: Colors.white,
          // onPressed: _submit,
          onPressed: () => Navigator.of(context).pushNamed(''),
          color: Colors.orange[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
