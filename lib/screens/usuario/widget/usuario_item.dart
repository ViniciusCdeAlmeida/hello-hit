import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';

class UsuarioItem extends StatelessWidget {
  final Usuario usuario;

  UsuarioItem(this.usuario);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 60.0,
                    minRadius: 10.0,
                    backgroundImage: NetworkImage(usuario.imagem),
                  ),
                ),
              ),
              Positioned.fill(
                right: deviceSize.width / 3.2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 18,
                    width: 41,
                    decoration: BoxDecoration(
                      color: Colors.orange[900],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 9.0,
                          color: Colors.white,
                        ),
                        Text(
                          'PRO',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(usuario.nome),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconRow(
                texto: usuario.hits.toString(),
                icon: Icons.star,
                width: 60,
                height: 60,
                titulo: 'Hits',
              ),
              IconRow(
                icon: Icons.question_answer,
                width: 30,
                height: 30,
                titulo: 'Inbox',
              ),
              IconRow(
                icon: Icons.emoji_events,
                width: 30,
                height: 30,
                titulo: 'Ranking',
              ),
              IconRow(
                icon: Icons.person_add_alt_1,
                width: 30,
                height: 30,
                titulo: 'Be Fan',
              ),
              IconRow(
                texto: usuario.fans.toString(),
                icon: Icons.flag,
                width: 60,
                height: 60,
                titulo: 'Fans',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
              color: Colors.orange[700],
              onPressed: () {},
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(usuario.mensagem),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('TEAM MEMBER OF'),
              ],
            ),
          ),
          GridView.custom(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: (3.3 / 2),
              mainAxisSpacing: 10,
            ),
            childrenDelegate: SliverChildListDelegate(
              usuario.usuarios
                  .map((usuario) => UsuarioParente(imagem: usuario.imagem))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('SKILLS'),
              ],
            ),
          ),
          GridView.custom(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 30,
              childAspectRatio: (5 / 2),
              mainAxisSpacing: 10,
            ),
            childrenDelegate: SliverChildListDelegate(
              usuario.skills
                  .map((skill) => UsuarioSkills(skill: skill))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Row(
              children: [
                Text('PROFILE POSTS'),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, idx) {
              return PostCard(post: usuario.posts[idx]);
            },
            itemCount: usuario.posts.length,
          ),
        ],
      ),
    );
  }
}

class UsuarioSkills extends StatelessWidget {
  final String skill;

  UsuarioSkills({
    this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Container(
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
      ),
    );
  }
}

class UsuarioParente extends StatelessWidget {
  final String imagem;

  UsuarioParente({
    this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   shape: BoxShape.rectangle,
      //   border: Border.all(
      //     width: 1,
      //     color: Colors.grey[500],
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          const Radius.circular(3),
        ),
        child: Image.network(
          imagem,
          height: 10,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      backgroundImage: NetworkImage(post.imagem),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teste',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '10h atrás',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              child: Image.network(
                post.imagem,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text('${post.hits} Hits'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.chat_bubble,
                    color: Colors.orange,
                  ),
                ),
                Text('${post.idsComentario.length} Comentários')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({
    Key key,
    this.texto,
    this.icon,
    this.height,
    this.width,
    this.titulo,
  }) : super(key: key);

  final String texto;
  final String titulo;
  final IconData icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          width: width,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (texto != null) Text(texto),
              Icon(
                icon,
                color: Colors.orange[900],
              ),
            ],
          ),
        ),
        Text(titulo),
      ],
    );
  }
}
