import 'package:flutter/material.dart';

class EscolhaCategoriaScreen extends StatefulWidget {
  @override
  _EscolhaCategoriaScreenState createState() => _EscolhaCategoriaScreenState();
}

class _EscolhaCategoriaScreenState extends State<EscolhaCategoriaScreen> {
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
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Search and select the Skills you love'),
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
                  'SKIP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'DONE',
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
