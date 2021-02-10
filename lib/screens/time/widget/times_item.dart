import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/profile_time_model.dart';

import 'package:hellohit/screens/profile/profile_time_screen.dart';

class TimesItem extends StatelessWidget {
  final ProfileTime time;
  TimesItem(this.time);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProfileTimeScreen.routeName,
            arguments: time.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time.user.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(time.nomeOrganizacao),
                // Text(time.nomeOrganizacao),
              ],
            ),
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                // maxRadius: 30.0,
                radius: 40.0,
                child: Image.asset(
                    'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                // time.imageUrl == null
                //     ? Image.asset(
                //         'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                //     : Image.network(
                //         time.imageUrl,
                //         height: 100,
                //         fit: BoxFit.contain,
                //       ),
                // backgroundImage: NetworkImage(
                //   time.banner,
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
