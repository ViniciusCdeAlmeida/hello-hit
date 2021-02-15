import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/service/stores/autenticacao_store.dart';
import 'package:hellohit/service/stores/marketplace_store.dart';
import 'package:hellohit/screens/oportunidade/widget/oportunidade_item.dart';
import 'package:hellohit/widgets/custom_sliverAppBar.dart';
import 'package:provider/provider.dart';

class OportunidadeScreen extends StatefulWidget {
  static const routeName = '/oportunidadeScreen';
  @override
  _OportunidadeScreenState createState() => _OportunidadeScreenState();
}

class _OportunidadeScreenState extends State<OportunidadeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldMarketKey =
      new GlobalKey<ScaffoldState>();
  MarketplaceStore _marketplaceStore;
  AutenticacaoStore _autenticacaoStore;
  String id;
  String idUsuario;

  @override
  void didChangeDependencies() {
    _marketplaceStore = Provider.of<MarketplaceStore>(context);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    id = ModalRoute.of(context).settings.arguments;
    _marketplaceStore.getOportunidade(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMarketKey,
      // ignore: missing_return
      body: Observer(
        builder: (_) {
          switch (_marketplaceStore.marketplaceState) {
            case MarketplaceState.inicial:
            case MarketplaceState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case MarketplaceState.carregado:
              return CustomScrollView(
                slivers: <Widget>[
                  CustomSliverAppBar(
                    titulo: '',
                    // imagem: _maketplaceStore.carreira.imagem,
                    // banner: _maketplaceStore.carreira.banner,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      OportunidadeItem(
                        _marketplaceStore.carreira,
                        _marketplaceStore.hitOportunidade,
                        idUsuario,
                      ),
                    ]),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
