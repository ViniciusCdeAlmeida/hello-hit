import 'package:flutter/material.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/screens/profile/widget/profile_fan_item.dart';
import 'package:hellohit/service/stores/autenticacao_store.dart';
import 'package:hellohit/service/stores/profile_store.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_parente_item.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:hellohit/widgets/lista_icones.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ProfileUsuarioItem extends StatefulWidget {
  final Profile usuario;

  ProfileUsuarioItem(this.usuario);

  @override
  _ProfileUsuarioItemState createState() => _ProfileUsuarioItemState();
}

class _ProfileUsuarioItemState extends State<ProfileUsuarioItem> with SingleTickerProviderStateMixin {
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

  Future<void> makeHitTalento() async {
    await _profileStore.makeHitUsuario(_autenticacaoStore.usuarioLogado.id, widget.usuario.id);
  }

  Future<void> makeFanTalento() async {
    await _profileStore.makeFanUsuario(_autenticacaoStore.usuarioLogado.id, widget.usuario.id);
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
                  backgroundImage: widget.usuario.user.avatarUrl == null
                      ? AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                      : NetworkImage(widget.usuario.user.avatarUrl),
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
        Text(widget.usuario.user.fullName),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
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
                  makeHitTalento();
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
              onTap: () {
                Socket socket = io(
                    'http://developer.api.hellohit.co',
                    OptionBuilder()
                        .setTransports(['websocket']) // for Flutter or Dart VM
                        .disableAutoConnect() // disable auto-connection
                        .setExtraHeaders({'foo': 'bar'}) // optional
                        .build());
                socket.connect();

                var conversation = {
                  "receiver": widget.usuario.user.id,
                  "sender": _autenticacaoStore.usuarioLogado.id,
                };

                socket.emit('new_chat', conversation);

                Navigator.of(context).pushNamed(
                  ChatScreen.routeName,
                  arguments: widget.usuario.user.username,
                );
              },
              child: IconRow(
                icon: Icons.question_answer,
                width: 38,
                height: 38,
                titulo: 'Hit Chat',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: IconRow(
                icon: Icons.plus_one,
                width: 38,
                height: 38,
                titulo: 'Invite to team',
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.usuario.fans.contains(widget.usuario.user.id)) {
                    widget.usuario.fansCount -= 1;
                    widget.usuario.fans.removeWhere((element) => element == widget.usuario.user.id);
                    var snackBar = SnackBar(content: Text('You removed your fan.'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    widget.usuario.fansCount += 1;
                    widget.usuario.fans.insert(0, widget.usuario.user.id);
                    var snackBar = SnackBar(
                        content: Text(
                            'Yay! Now you follow ${widget.usuario.user.username == null ? widget.usuario.user.fullName : widget.usuario.user.username}'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                  makeFanTalento();
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
              texto: widget.usuario.fansCount.toString(),
              icon: Icons.flag,
              width: 60,
              height: 60,
              titulo: 'Fans',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            bottom: 15.0,
            right: 20.0,
            left: 20.0,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100,
                  child: Text(widget.usuario.category.description),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  // width: 100,
                  child: Text(widget.usuario.user.username),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    child: Text(widget.usuario.location == null ? '' : widget.usuario.location),
                  )),
            ],
          ),
        ),
        if (_autenticacaoStore.usuarioLogado.id == widget.usuario.user.id)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                color: Colors.grey[100],
                onPressed: () => Navigator.of(context).popAndPushNamed(
                      ProfileUsuarioEdicaoScreen.routeName,
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
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          child: Text(
            widget.usuario.bio == "" || widget.usuario.bio == null ? 'No bio yet.' : widget.usuario.bio,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_horiz),
              Text(
                'TEAMS',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        // if (widget.usuario.teams.length > 0)
        //   GridView.custom(
        //     padding: const EdgeInsets.all(10),
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       crossAxisSpacing: 15,
        //       childAspectRatio: (3.3 / 2),
        //       mainAxisSpacing: 10,
        //     ),
        //     childrenDelegate: SliverChildListDelegate(
        //       widget.usuario.teams
        //           .map((usuario) => UsuarioParente(imagem: usuario.avatar))
        //           .toList(),
        //     ),
        //   )
        // else
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
        // if (widget.usuario.awards.length > 0)
        //   Container(
        //     height: 150,
        //     child: GridView.extent(
        //       maxCrossAxisExtent: 180,
        //       // mainAxisSpacing: 10,
        //       // crossAxisSpacing: 10,
        //       scrollDirection: Axis.horizontal,
        //       // itemCount:
        //       //     usuario.usuarios.length < 8 ? usuario.usuarios.length : 8,
        //       padding: const EdgeInsets.all(10.0),
        //       shrinkWrap: true,
        //       children: widget.usuario.awards
        //           .getRange(
        //               0,
        //               widget.usuario.awards.length >= 1 && widget.usuario.awards.length <= 21
        //                   ? widget.usuario.awards.length
        //                   : 22)
        //           .map(
        //             ((award) => Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     CircleAvatar(
        //                       radius: 35,
        //                       backgroundColor: Colors.transparent,
        //                       backgroundImage:
        //                           AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png'),
        //                       // backgroundImage: NetworkImage(memberProfile.avatar['url']
        //                       //     .toString()
        //                       //     .replaceAll(RegExp(r'localhost'), '192.168.15.8')
        //                       //     .toString()),
        //                     ),
        //                     Text(
        //                       'La Liga',
        //                       overflow: TextOverflow.ellipsis,
        //                       softWrap: true,
        //                       maxLines: 2,
        //                     ),
        //                   ],
        //                 )),
        //           )
        //           .toList(),
        //     ),
        //   )
        // else
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Coming Soon',
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
                'MY EXPERIENCE',
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
              'Coming Soon',
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
              'Coming Soon',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: [
        //       Text('SKILLS'),
        //     ],
        //   ),
        // ),
        // if (widget.usuario.skills.length > 0)
        //   GridView.custom(
        //     padding: const EdgeInsets.all(10),
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 4,
        //       crossAxisSpacing: 30,
        //       childAspectRatio: (5 / 2),
        //       mainAxisSpacing: 10,
        //     ),
        //     childrenDelegate: SliverChildListDelegate(
        //       widget.usuario.skills
        //           .map((skill) => UsuarioSkills(skill: skill.description))
        //           .toList(),
        //     ),
        //   ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Center(
        //     child: Text(
        //       'No Skills yet',
        //       style: TextStyle(fontSize: 16),
        //     ),
        //   ),
        // ),
        // Divider(
        //   thickness: 1,
        //   color: Colors.grey[300],
        // ),
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
          key: Key(Keys.postCard.commentsPostCard),
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
              if (widget.usuario.fansProfile.length != 0)
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
                )
              else
                Container(
                  child: Center(
                    child: Text('No hit posts'),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
