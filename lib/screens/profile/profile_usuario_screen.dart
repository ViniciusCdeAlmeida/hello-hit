import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/profile_model.dart';
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
  // Profile _profileAtual;
  String idArgs;
  int id;
  @override
  void didChangeDependencies() {
    idArgs = ModalRoute.of(context).settings.arguments;
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _profileStore.loadUsuarioProfile(idArgs);
    // _profileAtual = _profileStore.usuario;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Observer(
        // ignore: missing_return
        builder: (_) {
          switch (_profileStore.profilesState) {
            case ProfileState.inicial:
            case ProfileState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ProfileState.carregado:
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.03,
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        floating: false,
                        centerTitle: true,
                        title: Text(_profileStore.usuario.user.full_name),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          ProfileUsuarioItem(_profileStore.usuario),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
