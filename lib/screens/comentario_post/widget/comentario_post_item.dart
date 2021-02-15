import 'package:flutter/material.dart';
import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';

class ComentarioPostItem extends StatelessWidget {
  final Comentario comentario;
  ComentarioPostItem(this.comentario);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            OportunidadeScreen.routeName,
            arguments: comentario.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comentario.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                // maxRadius: 30.0,
                radius: 40.0,
                child: Image.asset(
                    'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                // carreira.imageUrl == null
                //     ? Image.asset(
                //         'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                //     : Image.network(
                //         carreira.imageUrl,
                //         height: 100,
                //         fit: BoxFit.contain,
                //       ),
                // backgroundImage: NetworkImage(
                //   carreira.banner,
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
