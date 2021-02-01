import 'package:flutter/material.dart';

class PostagemScreen extends StatefulWidget {
  @override
  _PostagemScreenState createState() => _PostagemScreenState();
}

class _PostagemScreenState extends State<PostagemScreen> {
  _enviarMensagem() {}

  _enviarFoto() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/barra.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 125),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/images/perfil_assets/Perfil_page_icon.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 60, top: 15),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Hello! Write something to your fans.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
