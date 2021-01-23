import 'package:flutter/material.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/screens/profile/widget/profile_skill_item.dart';
import 'package:hellohit/screens/profile/widget/profile_time_oportunidades_item.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_parente_item.dart';
import 'package:hellohit/widgets/lista_icones.dart';
import 'package:hellohit/widgets/post_card_item.dart';

class ProfileUsuarioItem extends StatelessWidget {
  final Usuario usuario;

  ProfileUsuarioItem(this.usuario);
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
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
                right: deviceSize.orientation == Orientation.portrait
                    ? deviceSize.size.width / 3.2
                    : deviceSize.size.width / 2.6,
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
