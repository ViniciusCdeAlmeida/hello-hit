import 'package:flutter/material.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/screens/profile/widget/profile_custom_grid.dart';
import 'package:hellohit/screens/profile/widget/profile_skill_item.dart';
import 'package:hellohit/screens/profile/widget/profile_time_oportunidades_item.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_parente_item.dart';
import 'package:hellohit/widgets/lista_icones.dart';
import 'package:hellohit/widgets/post_card_item.dart';

class ProfileTimeItem extends StatelessWidget {
  final Usuario usuario;

  ProfileTimeItem(this.usuario);
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: deviceSize.size.width,
            height: deviceSize.orientation == Orientation.portrait
                ? deviceSize.size.height / 2
                : deviceSize.size.height * 1.3,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    usuario.imagem,
                    height: deviceSize.orientation == Orientation.portrait
                        ? deviceSize.size.height / 3
                        : deviceSize.size.height,
                    width: deviceSize.size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: deviceSize.orientation == Orientation.portrait
                          ? deviceSize.size.height / 4.6
                          : deviceSize.size.height / 1.2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[900],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(3),
                        ),
                        child: Image.network(
                          usuario.imagem,
                          height: 120,
                          width: 130,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  right: deviceSize.orientation == Orientation.portrait
                      ? deviceSize.size.width / 3.5
                      : deviceSize.size.width / 2.75,
                  top: deviceSize.orientation == Orientation.portrait
                      ? deviceSize.size.height / 8
                      : deviceSize.size.width / 2.5,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 18,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange[900],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 9.0,
                            color: Colors.white,
                          ),
                          Text(
                            'TEAM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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
                'Edit Team',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(usuario.mensagem),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.network(
                        usuario.imagem,
                        height: deviceSize.orientation == Orientation.portrait
                            ? deviceSize.size.height / 10
                            : deviceSize.size.height / 3.5,
                        width: deviceSize.size.width / 5,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('BE LIKE ${usuario.nome} TEAM'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'BUILD YOUR TEAM',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    height: 50,
                    minWidth: 240,
                    color: Colors.orange[800],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('OPEN OPPORTUNITIES'),
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
              childAspectRatio: (2.7 / 2),
              mainAxisSpacing: 10,
            ),
            childrenDelegate: SliverChildListDelegate(
              usuario.oportunidades
                  .map((oportunidade) => TimeOportunidades(
                        imagem: oportunidade.banner,
                        nome: oportunidade.nomeOrganizacao,
                      ))
                  .toList(),
            ),
          ),
          // MEMBROS
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('TEAM MEMBERS'),
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
