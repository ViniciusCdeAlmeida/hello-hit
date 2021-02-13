import 'package:flutter/material.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/screens/marketplace/widget/marketplace_middle_section.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OportunidadeItem extends StatefulWidget {
  final Oportunidade carreira;
  final Function hitOpportunities;
  final String idUsuario;

  OportunidadeItem(this.carreira, this.hitOpportunities, this.idUsuario);

  @override
  _OportunidadeItemState createState() => _OportunidadeItemState();
}

class _OportunidadeItemState extends State<OportunidadeItem> {
  // ignore: close_sinks
  YoutubePlayerController _controller;
  Color _corHit;

  @override
  void initState() {
    _corHit = widget.carreira.hits.contains(widget.idUsuario)
        ? Colors.blue
        : Colors.grey;
    _controller = YoutubePlayerController(
      initialVideoId: widget.carreira.urlYoutube,
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
              // Padding(
              //   padding: const EdgeInsets.all(18.0),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: const Radius.circular(15.0),
              //       bottomRight: const Radius.circular(15.0),
              //       topLeft: const Radius.circular(15.0),
              //       topRight: const Radius.circular(15.0),
              //     ),
              //     child: widget.carreira.imageUrl == null
              //         ? AssetImage(
              //             'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
              //         : Image.network(
              //             widget.carreira.imageUrl,
              //             height: 200,
              //             width: MediaQuery.of(context).size.width,
              //             fit: BoxFit.fitWidth,
              //           ),
              //   ),
              // ),
              Center(
                child: Padding(
                  // padding: const EdgeInsets.only(top: 180.0),

                  padding: const EdgeInsets.only(top: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 40.0,
                    minRadius: 10.0,
                    backgroundImage: widget.carreira.imageUrl == ""
                        ? AssetImage(
                            'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                        : NetworkImage(widget.carreira.imageUrl),
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
                    widget.carreira.title,
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.carreira.typeOpportunity,
                            textAlign: TextAlign.left,
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 80.0,
                                icon: ImageIcon(
                                  AssetImage(
                                      'assets/images/oportunidades_full_assets/icone_favoritar_desabilitade.png'),
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                              Text('Mark as Favorite')
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.carreira.typeOpportunity,
                            textAlign: TextAlign.left,
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 80.0,
                                icon: ImageIcon(
                                  AssetImage(
                                      'assets/images/oportunidades_full_assets/Hit_desabilitado.png'),
                                  color: _corHit,
                                ),
                                onPressed: () {
                                  var dados = {'id': widget.idUsuario};
                                  widget.hitOpportunities(dados);
                                  setState(() {
                                    _corHit == Colors.blue
                                        ? _corHit = Colors.grey
                                        : _corHit = Colors.blue;
                                  });
                                },
                              ),
                              Text('Hit it!')
                            ],
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
            texto:
                'Duration: ${DateFormat('yyyy-MM-dd').format(widget.carreira.expireAt)}',
            deviceSize: deviceSize,
            viewall: true,
            rota: null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 290.0),
            child: Text(widget.carreira.title),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.carreira.description,
              textAlign: TextAlign.justify,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
          if (widget.carreira.urlYoutube != '')
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
                GestureDetector(
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
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
