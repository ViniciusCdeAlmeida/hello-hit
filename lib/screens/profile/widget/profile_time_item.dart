import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/widget/profile_skill_item.dart';
import 'package:hellohit/screens/profile/widget/profile_time_oportunidades_item.dart';
import 'package:hellohit/widgets/lista_icones.dart';

class ProfileTimeItem extends StatefulWidget {
  ProfileTime usuario;
  final String usuarioImagem;
  final Function makeHit;
  final Function beFan;
  final String usuarioAtual;
  ProfileTimeItem(this.usuario, this.usuarioImagem, this.beFan, this.makeHit,
      this.usuarioAtual);

  @override
  _ProfileTimeItemState createState() => _ProfileTimeItemState();
}

class _ProfileTimeItemState extends State<ProfileTimeItem> {
  ProfileStore _profileStore;
  AutenticacaoStore _autenticacaoStore;
  @override
  void didChangeDependencies() {
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
    _profileStore = Provider.of<ProfileStore>(context);
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
                    // child: Image.network(
                    //   usuario.imagem,
                    //   height: deviceSize.orientation == Orientation.portrait
                    //       ? deviceSize.size.height / 3
                    //       : deviceSize.size.height,
                    //   width: deviceSize.size.width,
                    //   fit: BoxFit.fill,
                    // ),
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                widget.usuarioImagem == null ? 0.0 : 0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        border: Border.all(
                          width: widget.usuarioImagem == null ? 0.0 : 3.0,
                          color: Colors.grey[100],
                        ),
                      ),
                      child: ClipRRect(
                        child: widget.usuarioImagem == null
                            ? Image.asset(
                                'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                widget.usuarioImagem,
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
          Text(widget.usuario.user.full_name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   _profileStore.makeHitTime(widget.usuario.id);
                  // });
                },
                child: GestureDetector(
                  onTap: () {},
                  child: IconRow(
                    texto: widget.usuario.hitCount.toString(),
                    icon: Icons.star,
                    width: 60,
                    height: 60,
                    titulo: 'Hits',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: IconRow(
                  icon: Icons.question_answer,
                  width: 38,
                  height: 38,
                  titulo: 'Inbox',
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: IconRow(
                  icon: Icons.plus_one,
                  width: 38,
                  height: 38,
                  titulo: 'Insert in your team',
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.beFan(widget.usuario.id);
                },
                child: IconRow(
                  icon: Icons.person_add_alt_1,
                  width: 38,
                  height: 38,
                  titulo: 'Be Fan',
                ),
              ),
              IconRow(
                texto: widget.usuario.fanCount.toString(),
                icon: Icons.flag,
                width: 60,
                height: 60,
                titulo: 'Fans',
              ),
            ],
          ),
          if (_autenticacaoStore.autenticacao.userType == 'TEAM' &&
              _autenticacaoStore.autenticacao.id == widget.usuario.user.id)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FlatButton(
                color: Colors.orange[700],
                onPressed: () => Navigator.of(context).popAndPushNamed(
                  ProfileTimeEdicaoScreen.routeName,
                  arguments: _autenticacaoStore.autenticacao.id,
                ),
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
            // child: Text(usuario.mensagem),
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
                        // child: Image.network(
                        //   usuario.avatar,
                        //   height: deviceSize.orientation == Orientation.portrait
                        //       ? deviceSize.size.height / 10
                        //       : deviceSize.size.height / 3.5,
                        //   width: deviceSize.size.width / 5,
                        //   fit: BoxFit.fill,
                        // ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Text('BE LIKE ${widget.usuario.user.full_name} TEAM'),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 20.0,
                    right: 15.0,
                  ),
                  child: Text(
                    widget.usuario.bio == ""
                        ? 'No bio yet.'
                        : widget.usuario.bio,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
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
          if (widget.usuario.openOpportunities.length > 0)
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
                widget.usuario.openOpportunities
                    .map((oportunidade) => TimeOportunidades(
                          imagem: oportunidade.imageUrl,
                          nome: oportunidade.title,
                        ))
                    .toList(),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'No Opportunities yet',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          //MEMBROS
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TEAM MEMBERS'),
                if (widget.usuario.members.length > 0)
                  InkWell(
                    onTap: () {},
                    // onTap: () => Navigator.of(context)
                    //     .pushNamed(ProfileMembroScreen.routeName),
                    child: Text(
                        'See all ${widget.usuario.members.length} members'),
                    // ),
                  ),
              ],
            ),
          ),

          if (widget.usuario.members.length > 0)
            GridView.extent(
              maxCrossAxisExtent: 50,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // itemCount:
              //     usuario.usuarios.length < 8 ? usuario.usuarios.length : 8,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: widget.usuario.members
                  .getRange(
                      0,
                      widget.usuario.members.length >= 1 &&
                              widget.usuario.members.length <= 8
                          ? widget.usuario.members.length
                          : 14)
                  .map(
                    ((usuario) => CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(usuario.avatar),
                        )),
                  )
                  .toList(),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'No Members yet',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('SKILLS'),
              ],
            ),
          ),
          if (widget.usuario.skills.length > 0)
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
                widget.usuario.skills
                    .map((skill) => UsuarioSkills(skill: skill.description))
                    .toList(),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'No Skills yet',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          Divider(
            thickness: 1,
            color: Colors.grey,
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
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (_, idx) {
          //     return PostCard(post: usuario.posts[idx]);
          //   },
          //   itemCount: usuario.posts.length,
          // ),
        ],
      ),
    );
  }
}
