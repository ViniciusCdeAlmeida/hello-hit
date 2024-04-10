import 'package:flutter/material.dart';
import 'package:hellohit/models/usuario_model.dart';

class ProfileFanItem extends StatelessWidget {
  final Usuario usuario;

  const ProfileFanItem({Key key, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                onBackgroundImageError: (__, _) =>
                    AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png'),
                backgroundImage: NetworkImage(
                    usuario.avatar['url'].toString().replaceAll(RegExp(r'localhost'), '192.168.15.14').toString(),
                    scale: 0.3),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('Name'),
              //       Text('Location'),
              //       Text('Description'),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
