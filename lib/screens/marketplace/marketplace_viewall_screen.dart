import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_opportunities_item.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/service/stores/index_stores.dart';

class MarketplaceViewallScreen extends StatefulWidget {
  static const routeName = '/marketplaceViewallScreen';
  @override
  _MarketplaceViewallScreenState createState() => _MarketplaceViewallScreenState();
}

class _MarketplaceViewallScreenState extends State<MarketplaceViewallScreen> {
  MarketplaceStore _maketplaceStore;

  @override
  void didChangeDependencies() {
    _maketplaceStore = Provider.of<MarketplaceStore>(context);
    _maketplaceStore.oportunidadeList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Talents Opportunites',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Material(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  // ignore: missing_return
                  builder: (_) {
                    switch (_maketplaceStore.marketplaceState) {
                      case MarketplaceState.inicial:
                        return Container();
                      case MarketplaceState.carregando:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case MarketplaceState.carregado:
                        return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          // physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (_maketplaceStore.carreirasOriginal.length),
                          itemBuilder: (_, idx) => Column(
                            children: [
                              MarketplaceOpportunitiesItem(
                                _maketplaceStore.carreirasOriginal[idx],
                              ),
                            ],
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
