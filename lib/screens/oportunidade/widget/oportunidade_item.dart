import 'package:flutter/material.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_middle_section.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OportunidadeItem extends StatefulWidget {
  final Oportunidade carreira;

  OportunidadeItem(this.carreira);

  @override
  _OportunidadeItemState createState() => _OportunidadeItemState();
}

class _OportunidadeItemState extends State<OportunidadeItem> {
  // ignore: close_sinks
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: '',
      params: const YoutubePlayerParams(
        autoPlay: false,
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        privacyEnhanced: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
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
                    widget.carreira.imagem,
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
                    backgroundImage: NetworkImage(widget.carreira.banner),
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
                    widget.carreira.nomeOrganizacao,
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.carreira.categoria,
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
                            widget.carreira.categoria,
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
            child: Text(widget.carreira.nomeOrganizacao),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.carreira.descricao,
              textAlign: TextAlign.justify,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: YoutubePlayerControllerProvider(
                child: player,
                // Passing controller to widgets below.
                controller: _controller,
              ),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Condemend'),
                      ),
                      ImageIcon(
                        AssetImage(
                            'assets/images/oportunidades_full_assets/candidatar_se.png'),
                        color: Colors.blue,
                        size: 70,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text('I\'m not interesed'),
                      ),
                      ImageIcon(
                        AssetImage(
                            'assets/images/oportunidades_full_assets/nao_tenho_interese.png'),
                        color: Colors.red,
                        size: 70,
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
