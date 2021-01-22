import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/usuario/widget/usuario_item.dart';
import 'package:provider/provider.dart';

class UsuarioScreen extends StatefulWidget {
  static const routeName = '/profileScreen';
  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  ProfileStore _profileStore;
  int id;
  @override
  void didChangeDependencies() {
    _profileStore = Provider.of<ProfileStore>(context);
    _profileStore.seed().whenComplete(() => _profileStore.loadProfile(1));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_return
      body: Observer(builder: (_) {
        switch (_profileStore.profilesState) {
          case ProfileState.inicial:
          case ProfileState.carregando:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ProfileState.carregado:
            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    UsuarioItem(_profileStore.usuario),
                  ]),
                ),
              ],
            );
        }
      }),
    );
  }
}
