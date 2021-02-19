import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/conversas/conversas_screen.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:hellohit/screens/usuario/times_oportunidades_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key, this.usuario}) : super(key: key);

  final Usuario usuario;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with TickerProviderStateMixin {
  var _expandedHelp = false;
  var _expandedSettings = false;

  Animation<double> _fadeAnimation;
  AnimationController _controller, _controllerCard;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1300,
      ),
    );
    _controllerCard = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 2000,
      ),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controllerCard,
        curve: Curves.ease,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Future.delayed(const Duration(seconds: 2), () =>
      _controllerCard.forward();
      // );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerCard.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.grey[200],
                  height: 180,
                  child: DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.clear),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: widget.usuario.avatar != null
                                  ? NetworkImage(widget.usuario.avatar
                                      .toString()
                                      .replaceAll(RegExp(r'localhost'), '192.168.15.4')
                                      .toString())
                                  : AssetImage(
                                      'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                // width: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.usuario.username,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.access_alarm),
                                        Text(
                                          widget.usuario.categoria.description,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GridView.custom(
                              padding: const EdgeInsets.all(30),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                childAspectRatio: (4.2 / 2),
                                mainAxisSpacing: 20,
                              ),
                              childrenDelegate: SliverChildListDelegate([
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Bookmarks',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Turn Pro',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'My Teams',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Notification',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Opportunities',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Battle Rounds',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => widget.usuario.userType == 'TEAM'
                                      ? Navigator.of(context).pushNamed(
                                          ProfileTimeEdicaoScreen.routeName,
                                          arguments: widget.usuario.id,
                                        )
                                      : Navigator.of(context).pushNamed(
                                          ProfileUsuarioEdicaoScreen.routeName,
                                          arguments: widget.usuario.id,
                                        ),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Edit Profile',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'HelloHit Pay',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Statistics',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.ac_unit),
                                          Text(
                                            'Talents Show',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 00.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[400],
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          color: Colors.grey[400],
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Row(
                                  children: [
                                    Icon(Icons.chat),
                                    Text(
                                      'Help & Support',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  // key: Key('expandCardButton_${widget.levantamento.id}'),
                                  icon: Icon(
                                    (_expandedHelp ? Icons.expand_less : Icons.expand_more),
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _expandedHelp = !_expandedHelp;
                                    });
                                  },
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                height: _expandedHelp ? 280 : 0,
                                // width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    cardDrawer(titulo: 'Help Center'),
                                    cardDrawer(titulo: 'Support Inbox'),
                                    cardDrawer(titulo: 'Report a problem'),
                                    cardDrawer(titulo: 'Terms & Policies'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Colors.grey[400],
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Row(
                                  children: [
                                    Icon(Icons.chat),
                                    Text(
                                      'Settings & Privacy',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  // key: Key('expandCardButton_${widget.levantamento.id}'),
                                  icon: Icon(
                                    (_expandedSettings ? Icons.expand_less : Icons.expand_more),
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _expandedSettings = !_expandedSettings;
                                    });
                                  },
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                height: _expandedSettings ? 210 : 0,
                                // width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    cardDrawer(titulo: 'Settings'),
                                    cardDrawer(titulo: 'Private Shortcuts'),
                                    cardDrawer(titulo: 'App Language'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed(AutenticacaoUsuarioScreen.routeName);
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector cardDrawer({String titulo, Future<Object> route}) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.chat),
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
