import 'package:flutter/material.dart';

class ProfileMembroItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Image.asset(
                  // 'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                  'assets/images/perfil_assets/Perfil_page_icon.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    Text('Location'),
                    Text('Description'),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 80.0,
            bottom: 8.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: Image.network(
                    'https://z2r3u4a8.stackpathcdn.com/wp-content/uploads/2015/10/jogos-de-baisebal-no-petco-park-1024x599.jpg',
                    // height: 50,
                    width: 170,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(7),
                    ),
                    child: Image.network(
                      'https://z2r3u4a8.stackpathcdn.com/wp-content/uploads/2015/10/jogos-de-baisebal-no-petco-park-1024x599.jpg',
                      // height: 50,
                      width: 170,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
