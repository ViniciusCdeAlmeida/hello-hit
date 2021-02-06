import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/conversas/conversas_screen.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/usuario/times_oportunidades_screen.dart';

class CustomDrawer extends StatelessWidget {
  final Usuario usuario;

  const CustomDrawer({Key key, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          child: Image.asset(
                            usuario.avatar != null
                                ? usuario.avatar
                                : 'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text(
                                usuario.full_name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'data',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),

                              // Text(usuario.full_name),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 12.0),
                    //   child: Row(
                    //     children: [
                    //       Text('${usuario.fans} Fans'),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 8.0),
                    //         child: Text('data'),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue[700],
              ),
              title: const Text(
                'My Profile',
              ),
              onTap: () {
                Navigator.of(context).pop();
                usuario.userType == 'Team'
                    ? Navigator.of(context).pushNamed(
                        ProfileTimeEdicaoScreen.routeName,
                        arguments: usuario.id,
                      )
                    : Navigator.of(context).pushNamed(
                        ProfileUsuarioEdicaoScreen.routeName,
                        arguments: usuario.id,
                      );
              },
              // key: Key(Keys.homeDrawer),
            ),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: Colors.blue[700],
              ),
              title: const Text(
                'Chat',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConversasScreen(),
                  ),
                );
              },
              // key: Key(Keys.homeDrawer),
            ),
            ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.blue[700],
              ),
              title: const Text('My jobs & Teams'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(TimesOportunidadesScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark_sharp,
                color: Colors.blue[700],
              ),
              title: const Text('Bookmarks'),
              onTap: () {
                // Navigator.of(context).pushNamed(ConexaoScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: Colors.blue[700],
              ),
              title: const Text('Lists'),
              onTap: () {
                // _configBens(context);
              },
              // key: Key(Keys.digitosDrawer),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue[700],
              ),
              title: const Text('Settings'),
              onTap: () {
                // _configNumero(context);
              },
              // key: Key(Keys.prefixoDrawer),
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: Icon(
                Icons.credit_card,
                color: Colors.blue[700],
              ),
              title: const Text('Your Cards'),
              onTap: () {},
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: Icon(
                Icons.account_balance,
                color: Colors.blue[700],
              ),
              title: const Text('Add Bank'),
              onTap: () {},
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: Icon(
                Icons.help,
                color: Colors.blue[700],
              ),
              title: const Text('Help and support'),
              onTap: () {},
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/menu_open_assets/Selo_Perfil_Pro.png',
                  width: 30,
                  height: 50,
                  fit: BoxFit.scaleDown,
                ),
              ),
              title: const Text('Turn Pro'),
              onTap: () {},
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/versus.png',
                  width: 30,
                  height: 50,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      text: 'Battle Rounds',
                    ),
                    // TextSpan(
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 12,
                    //   ),
                    //   text: ' Soon',
                    // ),
                  ],
                ),
              ),
              // const Text('Battle Rounds'),
              onTap: () {},
            ),
            ListTile(
              // key: Key(Keys.rfidDrawer),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue[700],
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed(AutenticacaoUsuarioScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
