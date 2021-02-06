import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_opportunities_item.dart';
import 'package:hellohit/screens/time/tela_explicacao_time_screen.dart';

class TimeScreen extends StatefulWidget {
  static const routeName = '/timeScreen';
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
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
          'TEAMS',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/oportunidades_assets/box_encontrar_oportunidades.png'),
                          ),
                        ),
                        width: deviceSize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 48.0,
                                right: 48.0,
                                top: 10.0,
                              ),
                              child: Center(
                                child: Text(
                                  'Get Your Team\'s Work in Front of the right People Whether tha\'s new clients, prospective arts and sports talents candidates, or peers in the industry.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Theme.of(context).primaryColor,
                              onPressed: () => Navigator.of(context).pushNamed(
                                  TelaExplicacaoTimeScreen.routeName),
                              // icon: Icon(Icons.),
                              child: Text(
                                'CREATE TEAM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: deviceSize.height / 21,
                        margin: const EdgeInsets.only(top: 5.0),
                        color: Colors.grey[200],
                        child: Text('CHECK TEAMS LINKED TO YOUR TALENT'),
                      ),
                    ),
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
                      return Container();
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
            ],
          ),
        ],
      ),
    );
  }
}
