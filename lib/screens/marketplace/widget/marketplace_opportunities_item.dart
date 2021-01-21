import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';

class MarketplaceOpportunitiesItem extends StatelessWidget {
  final Oportunidade carreira;
  MarketplaceOpportunitiesItem(this.carreira);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            OportunidadeScreen.routeName,
            arguments: carreira.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carreira.categoria,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(carreira.nomeOrganizacao),
                Text(carreira.nomeOrganizacao),
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              // maxRadius: 30.0,
              radius: 40.0,
              child: Image.network(
                carreira.banner,
                height: 100,
                fit: BoxFit.contain,
              ),
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
