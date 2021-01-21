import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/carreira_model.dart';

class MarketplaceRecommendedItem extends StatelessWidget {
  final Carreira carreira;
  MarketplaceRecommendedItem(this.carreira);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        // maxRadius: 30.0,
        radius: 40.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            const Radius.circular(10),
          ),
          child: Image.network(
            carreira.banner,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
