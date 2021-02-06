import 'package:flutter/material.dart';
import 'package:hellohit/screens/full_post/widgets/app_bar_full_post.dart';
import 'package:hellohit/screens/full_post/widgets/comentario_hist.dart';
import 'package:hellohit/screens/full_post/widgets/usuario.dart';
import 'package:hellohit/screens/full_post/widgets/button_here_me.dart';

class FullPostScreen extends StatefulWidget {
  static const routeName = '/fullPostScreen';
  @override
  _FullPostScreenState createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  Text event = Text(
    'Sumer Olympics',
    style: TextStyle(color: Colors.orange[700]),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  //INICIO APP BAR CUSTOM FULL POST
                  AppBarFullPost(),
                  //FIM APP BAR CUSTOM FULL POST

                  SizedBox(
                    height: 5,
                  ),

                  //INICIO IMAGEM FULL POST
                  Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/around_the_world.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //FIM IMAGEM FULL POST

                  // INICIO COMENTARIO E HITS
                  ComentarioHitsFullPost(),
                  // FIM COMENTARIO E HITS

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      child: Text(
                        '100 meters dash at Summer Olympics Rio de Janeiro,'
                        'thanks for the crowd fans present there!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  //INICIO COMENTARIO POST

                  //INICIO USUARIO
                  UserFullPost(),
                  //FIM USUARIO

                  Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Container(
                      width: 200,
                      height: 65,
                      child: Text(
                        'Usain Bolt you rock in Summer Olympics Rio de Janeiro,'
                        'man you are the star og this event man, was great to see you!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange[700],
                          size: 20,
                        ),
                        Text(
                          '392 Hits',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  //INICIO COMENTARIO POST

                  SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text(
                      'Link this talent?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      'Usain Bolt is available for work!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ButtonHereMeFullPost(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
