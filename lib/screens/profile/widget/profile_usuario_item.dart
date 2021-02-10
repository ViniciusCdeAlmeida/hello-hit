import 'package:flutter/material.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/profile/widget/profile_skill_item.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_parente_item.dart';
import 'package:hellohit/widgets/lista_icones.dart';
import 'package:provider/provider.dart';

class ProfileUsuarioItem extends StatefulWidget {
  final Profile usuario;

  ProfileUsuarioItem(this.usuario);

  @override
  _ProfileUsuarioItemState createState() => _ProfileUsuarioItemState();
}

class _ProfileUsuarioItemState extends State<ProfileUsuarioItem>
    with SingleTickerProviderStateMixin {
  ProfileStore _profileStore;
  AutenticacaoStore _autenticacaoStore;
  TabController _tabController;
  @override
  void didChangeDependencies() {
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
    return Column(
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
                  backgroundImage: widget.usuario.avatar == null
                      ? AssetImage(
                          'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                      : NetworkImage(widget.usuario.avatar),
                ),
              ),
            ),
            if (widget.usuario.user.userType == 'PRO')
              Positioned.fill(
                right: deviceSize.orientation == Orientation.portrait
                    ? deviceSize.size.width / 3.2
                    : deviceSize.size.width / 2.6,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 18,
                    width: 37,
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
                            fontSize: 13,
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
        Text(widget.usuario.user.full_name),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconRow(
              texto: widget.usuario.hitsCount == null
                  ? '0'
                  : widget.usuario.hitsCount.toString(),
              icon: Icons.star,
              width: 60,
              height: 60,
              titulo: 'Hits',
            ),
            IconRow(
              icon: Icons.question_answer,
              width: 38,
              height: 38,
              titulo: 'Inbox',
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
            InkWell(
              onTap: () {},
              child: IconRow(
                icon: Icons.person_add_alt_1,
                width: 38,
                height: 38,
                titulo: 'Be Fan',
              ),
            ),
            IconRow(
              // texto: widget.usuario..toString(),
              texto: '0',
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
            onPressed: () => Navigator.of(context).popAndPushNamed(
              ProfileUsuarioEdicaoScreen.routeName,
              arguments: _autenticacaoStore.autenticacao.id,
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          widget.usuario.bio == "" || widget.usuario.bio == null
              ? 'No bio yet.'
              : widget.usuario.bio,
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('TEAM MEMBER OF'),
            ],
          ),
        ),
        if (widget.usuario.teams.length > 0)
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
              widget.usuario.teams
                  .map((usuario) => UsuarioParente(imagem: usuario.avatar))
                  .toList(),
            ),
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
          color: Colors.grey[300],
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
          ),
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
          color: Colors.grey[300],
        ),
        TabBar(
          controller: _tabController,
          tabs: [
            // Tab(
            //   icon: const Icon(Icons.apps),
            // ),
            Tab(
              icon: const Icon(Icons.format_list_bulleted),
            ),
            Tab(
              icon: const Icon(Icons.place),
            ),
            Tab(
              icon: const Icon(Icons.person_pin_circle_outlined),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              // GridView.custom(
              //   padding: const EdgeInsets.all(10),
              //   shrinkWrap: true,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 15,
              //     childAspectRatio: (3.3 / 2),
              //     mainAxisSpacing: 10,
              //   ),
              //   childrenDelegate: SliverChildListDelegate(
              // widget.usuario.usuarios
              //     .map((usuario) => UsuarioParente(imagem: usuario.imagem))
              //     .toList(),
              //       ),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: const Icon(Icons.home),
              //     title: TextField(
              //       decoration: const InputDecoration(
              //           hintText: 'Search for address...'),
              //     ),
              //   ),
              // ),

              Container(
                child: Center(
                  child: Text('No hit posts'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('No hit posts'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('No users'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
