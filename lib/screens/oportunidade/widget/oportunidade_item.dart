import 'package:flutter/material.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_middle_section.dart';

class OportunidadeItem extends StatelessWidget {
  final Oportunidade carreira;

  OportunidadeItem(this.carreira);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                  ),
                  child: Image.network(
                    carreira.imagem,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 40.0,
                    minRadius: 10.0,
                    backgroundImage: NetworkImage(carreira.banner),
                  ),
                ),
              ),
            ],
          ),
          Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    carreira.nomeOrganizacao,
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            carreira.categoria,
                            textAlign: TextAlign.left,
                          ),
                          IconButton(
                            iconSize: 80.0,
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/oportunidades_full_assets/icone_favoritar_desabilitade.png'),
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            carreira.categoria,
                            textAlign: TextAlign.left,
                          ),
                          IconButton(
                            iconSize: 80.0,
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/oportunidades_full_assets/Hit_desabilitado.png'),
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 1.0,
            color: Colors.orange[900],
          ),
          MarketplaceMiddleSection(
            texto: 'duration',
            deviceSize: deviceSize,
            viewall: true,
            rota: null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 290.0),
            child: Text(carreira.nomeOrganizacao),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              carreira.descricao,
              textAlign: TextAlign.justify,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text('VIDEO'),
            ),
          ),
          Divider(
            thickness: 2,
            height: 1.0,
          ),
          MarketplaceMiddleSection(
            texto: 'OPPORTUNITY CANDIDATES',
            deviceSize: deviceSize,
            viewall: false,
          ),
          Divider(
            thickness: 2,
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Condemend'),
                      ImageIcon(
                        AssetImage(
                            'assets/images/oportunidades_full_assets/candidatar_se.png'),
                        color: Colors.blue,
                        size: 90,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('I\'m not interesed'),
                      ImageIcon(
                        AssetImage(
                            'assets/images/oportunidades_full_assets/nao_tenho_interese.png'),
                        color: Colors.red,
                        size: 90,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
