import 'package:flutter/material.dart';

class PostagemComentarioScreen extends StatefulWidget {
  static const routeName = '/postagemComentarioScreen';
  @override
  _PostagemComentarioScreenState createState() =>
      _PostagemComentarioScreenState();
}

class _PostagemComentarioScreenState extends State<PostagemComentarioScreen> {
  Text event = Text(
    'Sumer Olympics',
    style: TextStyle(color: Colors.orange[700]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: false,
          centerTitle: true,
          title: Text('Edit your Profile'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text('Summer Olympics'),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'by ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'Usain Bolt ',
                                    style: TextStyle(
                                      color: Colors.orange[700],
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'for ',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Puma',
                                    style: TextStyle(
                                      color: Colors.orange[700],
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 55),
                                child: Text(
                                  '19h ago',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 95),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/around_the_world.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.comment_sharp,
                            color: Colors.orange[700],
                            size: 20,
                          ),
                          Text(
                            '103 Coments',
                            style: TextStyle(fontSize: 10),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange[700],
                            size: 20,
                          ),
                          Text(
                            '392 Hits',
                            style: TextStyle(fontSize: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {}, // handle your image tap here
                                  child: Image.asset(
                                    'assets/images/perfil_post_assets/comentar_post_click.png',
                                    fit: BoxFit
                                        .cover, // this is the solution for border
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {}, // handle your image tap here
                                  child: Image.asset(
                                    'assets/images/perfil_post_assets/hit_post_click.png',
                                    fit: BoxFit
                                        .cover, // this is the solution for border
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {}, // handle your image tap here
                                  child: Image.asset(
                                    'assets/images/perfil_post_assets/Compartilhar_post.png',
                                    fit: BoxFit
                                        .cover, // this is the solution for border
                                    width: 35,
                                    height: 35,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        child: Text(
                          '100 meters dash at Summer Olympics Rio de Janeiro,'
                          'thanks for the crowd fans present there!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 10),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'James Taylor',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  /*GestureDetector(
                                  onTap: () {}, // handle your image tap here
                                  child: Image.asset(
                                    'assets/images/perfil_post_assets/hit_post_click.png',
                                    fit: BoxFit
                                        .cover, // this is the solution for border
                                    width: 35,
                                    height: 35,
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 150, left: 47),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 145),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Text(
                                      'Link this talent?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Usain Bolt is available for work!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      RaisedButton(
                                        child: const Text(
                                          'Hire me',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        textColor: Colors.black,
                                        onPressed: () {},
                                        color: Colors.orange[700],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
