import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_recommended_item.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_banner.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_opportunities_item.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_middle_section.dart';

class MarketPlaceScreen extends StatefulWidget {
  @override
  _MarketPlaceScreenState createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  MarketplaceStore _maketplaceStore;

  @override
  void didChangeDependencies() {
    _maketplaceStore = Provider.of<MarketplaceStore>(context);
    _maketplaceStore.seed();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Talents Opportunites',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Numero'),
                              Text('Nome'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Numero'),
                              Text('Nome'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Numero'),
                              Text('Nome'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MarketplaceBanner(deviceSize),
                    MaketplaceDivider(deviceSize)
                  ],
                ),
              ),
              Divider(
                height: 2.0,
                color: Colors.orange,
                thickness: 2.0,
              ),
              Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_maketplaceStore.marketplaceState) {
                    case MarketplaceState.inicial:
                      return Center(
                        child: Text('vazio'),
                      );
                    case MarketplaceState.carregando:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case MarketplaceState.carregado:
                      return Flexible(
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (_maketplaceStore.present <=
                                    _maketplaceStore.carreirasOriginal.length)
                                ? _maketplaceStore.carreiras.length + 1
                                : _maketplaceStore.carreiras.length,
                            itemBuilder: (_, idx) {
                              return (idx == _maketplaceStore.carreiras.length)
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: deviceSize.width / 3.1),
                                      child: FlatButton.icon(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          _maketplaceStore.loadMore();
                                        },
                                        icon: Icon(Icons.visibility),
                                        label: const Text(
                                          'Load more',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        MarketplaceOpportunitiesItem(
                                          _maketplaceStore.carreiras[idx],
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ),
                      );
                  }
                },
              ),
              MarketplaceMiddleSection(
                texto: 'RECOMMENDED OPPORTUNITIES',
                deviceSize: deviceSize,
                viewall: true,
                rota: MarketplaceViewallScreen.routeName,
              ),
              Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_maketplaceStore.marketplaceState) {
                    case MarketplaceState.inicial:
                      return Center(
                        child: Text('vazio'),
                      );
                    case MarketplaceState.carregando:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case MarketplaceState.carregado:
                      return Container(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              (_maketplaceStore.carreirasOriginal.length),
                          itemBuilder: (_, idx) => Row(
                            children: [
                              MarketplaceRecommendedItem(
                                  _maketplaceStore.carreirasOriginal[idx]),
                            ],
                          ),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}