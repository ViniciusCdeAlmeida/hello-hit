import 'package:flutter/material.dart';
import 'package:hellohit/screens/conversas/conversas_screen.dart';
import 'package:hellohit/screens/autenticacao/escolha_usuario_screen.dart';
import 'package:hellohit/screens/usuario/times_oportunidades_screen.dart';

class CustomDrawer extends StatelessWidget {
  @visibleForTesting
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
                            // 'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                            'assets/images/perfil_assets/Perfil_page_icon.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text('data'),
                              Text('data'),
                              Text('data'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        children: [
                          Text('data'),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('data'),
                          ),
                        ],
                      ),
                    )
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
                Navigator.of(context).pushReplacementNamed('/');
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
              leading: Icon(
                Icons.credit_card,
                color: Colors.blue[700],
              ),
              title: const Text('Battle Rounds'),
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
                    .pushReplacementNamed(EscolhaUsuarioScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
