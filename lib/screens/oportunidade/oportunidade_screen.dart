import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/screens/oportunidade/widget/oportunidade_item.dart';
import 'package:hellohit/widgets/custom_sliverAppBar.dart';
import 'package:provider/provider.dart';

class OportunidadeScreen extends StatefulWidget {
  static const routeName = '/oportunidadeScreen';
  @override
  _OportunidadeScreenState createState() => _OportunidadeScreenState();
}

class _OportunidadeScreenState extends State<OportunidadeScreen> {
  MarketplaceStore _maketplaceStore;
  int id;
  @override
  void didChangeDependencies() {
    _maketplaceStore = Provider.of<MarketplaceStore>(context);
    id = ModalRoute.of(context).settings.arguments;
    _maketplaceStore.loadCarreira(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(
              titulo: 'teste',
              imagem: _maketplaceStore.carreira.imagem,
              banner: _maketplaceStore.carreira.banner,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                OportunidadeItem(_maketplaceStore.carreira),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
