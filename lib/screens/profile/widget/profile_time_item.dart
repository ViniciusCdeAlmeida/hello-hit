import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/widget/profile_fan_item.dart';
import 'package:hellohit/screens/profile/widget/profile_time_oportunidades_item.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_parente_item.dart';
import 'package:hellohit/service/stores/index_stores.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:hellohit/widgets/lista_icones.dart';

class ProfileTimeItem extends StatefulWidget {
  ProfileTime usuario;
  ProfileTimeItem(this.usuario);

  @override
  _ProfileTimeItemState createState() => _ProfileTimeItemState();
}

class _ProfileTimeItemState extends State<ProfileTimeItem> with SingleTickerProviderStateMixin {
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

  Future<void> makeHitTime() async {
    await _profileStore.makeHitTime(_autenticacaoStore.usuarioLogado.id, widget.usuario.id);
  }

  Future<void> makeFanTime() async {
    await _profileStore.makeFanTime(_autenticacaoStore.usuarioLogado.id, widget.usuario.id);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
    _profileStore = Provider.of<ProfileStore>(context);
    return Column(
      children: [
        SizedBox(
          width: deviceSize.size.width,
          height: deviceSize.orientation == Orientation.portrait
              ? deviceSize.size.height / 2
              : deviceSize.size.height * 1.3,
          child: Stack(
            children: [
              ClipRRect(),
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
                          color: Colors.grey.withOpacity(widget.usuario.user.avatarUrl == null ? 0.0 : 0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      border: Border.all(
                        width: widget.usuario.user.avatarUrl == null ? 0.0 : 3.0,
                        color: Colors.grey[100],
                      ),
                    ),
                    child: ClipRRect(
                      child: widget.usuario.user.avatarUrl == null
                          ? Image.asset(
                              'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              widget.usuario.user.avatarUrl
                                  .toString()
                                  .replaceAll(RegExp(r'localhost'), '192.168.15.14')
                                  .toString(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              key: Key(Keys.profileTeam.makeHitProfileTeamScreen),
              onTap: () {
                setState(() {
                  if (widget.usuario.hits.contains(widget.usuario.user.id)) {
                    widget.usuario.hitCount -= 1;
                    widget.usuario.hits.removeWhere((element) => element == widget.usuario.user.id);
                    var snackBar = SnackBar(content: Text('You removed your hit.'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    widget.usuario.hitCount += 1;
                    widget.usuario.hits.insert(0, widget.usuario.user.id);
                    var snackBar = SnackBar(
                        content: Text(
                            'Yay! You Hitted ${widget.usuario.user.username == null ? widget.usuario.user.fullName : widget.usuario.user.username}'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                  makeHitTime();
                });
              },
              child: IconRow(
                texto: widget.usuario.hitCount.toString(),
                icon: Icons.star,
                width: 60,
                height: 60,
                titulo: 'Hits',
              ),
            ),
            GestureDetector(
              key: Key(Keys.profileTeam.inboxProfileTeamScreen),
              onTap: () => Navigator.of(context).pushNamed(
                ChatScreen.routeName,
                arguments: {
                  'username': widget.usuario.user.username,
                  'idReceiver': widget.usuario.user.id,
                },
              ),
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
                icon: Icons.add,
                width: 38,
                height: 38,
                titulo: 'Insert in your team',
              ),
            ),
            GestureDetector(
              key: Key(Keys.profileTeam.beFanProfileTeamScreen),
              onTap: () {
                setState(() {
                  if (widget.usuario.fans.contains(widget.usuario.user.id)) {
                    widget.usuario.fanCount -= 1;
                    widget.usuario.fans.removeWhere((element) => element == widget.usuario.user.id);
                    var snackBar = SnackBar(content: Text('You removed your fan.'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    widget.usuario.fanCount += 1;
                    widget.usuario.fans.insert(0, widget.usuario.user.id);
                    var snackBar = SnackBar(
                        content: Text(
                            'Yay! Now you follow ${widget.usuario.user.username == null ? widget.usuario.user.fullName : widget.usuario.user.username}'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                  makeFanTime();
                });
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
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.usuario.category.description != null ? widget.usuario.category.description : ''),
              Text(widget.usuario.user.username),
              Text(widget.usuario.location),
            ],
          ),
        ),
        if (_autenticacaoStore.usuarioLogado.id == widget.usuario.user.id)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
                key: Key(Keys.profileTeam.editBtnProfileTeamScreen),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                color: Colors.grey[100],
                onPressed: () => Navigator.of(context).popAndPushNamed(
                      ProfileTimeEdicaoScreen.routeName,
                      arguments: _autenticacaoStore.usuarioLogado.id,
                    ),
                child: Container(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Edit Profile'),
                    ],
                  ),
                )),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(widget.usuario.personalWebsite),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Text('BE LIKE ${widget.usuario.user.fullName} TEAM'),
              ),
              // Divider(
              //   thickness: 1,
              //   color: Colors.grey[300],
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 20.0,
                  right: 15.0,
                ),
                child: Text(
                  widget.usuario.bio == "" ? 'No bio yet.' : widget.usuario.bio,
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
              Icon(Icons.more_horiz),
              Text(
                'OPEN OPPORTUNITIES',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
          color: Colors.grey[300],
        ),
        //MEMBROS

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_horiz),
              Text(
                'MY AWARDS',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        if (widget.usuario.awards.length > 0)
          Container(
            height: 150,
            child: GridView.extent(
              maxCrossAxisExtent: 180,
              // mainAxisSpacing: 10,
              // crossAxisSpacing: 10,
              scrollDirection: Axis.horizontal,
              // itemCount:
              //     usuario.usuarios.length < 8 ? usuario.usuarios.length : 8,
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              children: widget.usuario.awards
                  .getRange(
                      1,
                      widget.usuario.awards.length >= 1 && widget.usuario.awards.length <= 21
                          ? widget.usuario.awards.length
                          : 22)
                  .map(
                    ((award) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (award.awardName != null)
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png'),
                                // backgroundImage: NetworkImage(memberProfile.avatar['url']
                                //     .toString()
                                //     .replaceAll(RegExp(r'localhost'), '192.168.15.14')
                                //     .toString()),
                              ),
                            if (award.awardName != null)
                              Text(
                                award.awardName,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                              ),
                          ],
                        )),
                  )
                  .toList(),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'No Awards yet',
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_horiz),
              Text(
                'TEAM MEMBERS',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
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
            children: widget.usuario.membersProfile
                .getRange(
                    0,
                    widget.usuario.membersProfile.length >= 1 && widget.usuario.membersProfile.length <= 21
                        ? widget.usuario.membersProfile.length
                        : 22)
                .map(
                  ((memberProfile) => CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(memberProfile.avatar['url']
                            .toString()
                            .replaceAll(RegExp(r'localhost'), '192.168.15.14')
                            .toString()),
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
          color: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_horiz),
              Text(
                'MY SKILLS',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
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
            Tab(
              key: Key(Keys.profileTeam.myPostsTabProfileTeamScreen),
              icon: const Icon(Icons.format_list_bulleted),
            ),
            Tab(
              icon: const Icon(Icons.place),
            ),
            Tab(
              key: Key(Keys.profileTeam.myFansTabProfileTeamScreen),
              icon: const Icon(Icons.person_pin_circle_outlined),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              GridView.custom(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 10,
                ),
                childrenDelegate: SliverChildListDelegate(
                  widget.usuario.posts.map((post) => UsuarioParente(post: post)).toList(),
                ),
              ),
              Container(
                child: Center(
                  child: Text('No hit posts'),
                ),
              ),
              GridView.custom(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                ),
                childrenDelegate: SliverChildListDelegate(
                  widget.usuario.fansProfile.map((usuario) => ProfileFanItem(usuario: usuario)).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
