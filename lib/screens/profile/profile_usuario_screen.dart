import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/profile/widget/profile_usuario_item.dart';
import 'package:provider/provider.dart';

class ProfileUsuarioScreen extends StatefulWidget {
  static const routeName = '/profileUsuarioScreen';
  @override
  _ProfileUsuarioScreenState createState() => _ProfileUsuarioScreenState();
}

class _ProfileUsuarioScreenState extends State<ProfileUsuarioScreen> {
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
                    ProfileUsuarioItem(_profileStore.usuario),
                  ]),
                ),
              ],
            );
        }
      }),
    );
  }
}
