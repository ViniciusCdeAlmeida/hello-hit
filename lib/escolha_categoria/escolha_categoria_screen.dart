import 'package:flutter/material.dart';

class EsolhaCategoriaScreen extends StatefulWidget {
  @override
  _EsolhaCategoriaScreenState createState() => _EsolhaCategoriaScreenState();
}

class _EsolhaCategoriaScreenState extends State<EsolhaCategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Interest Categories",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Select below the categories you like best",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange[700],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'SKIPE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'CLOSE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
