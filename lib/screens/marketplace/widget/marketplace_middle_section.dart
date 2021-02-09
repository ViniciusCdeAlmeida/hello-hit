import 'package:flutter/material.dart';

class MarketplaceMiddleSection extends StatelessWidget {
  final Size deviceSize;
  final bool viewall;
  final String texto;
  final String rota;

  MarketplaceMiddleSection({
    this.deviceSize,
    this.viewall,
    this.texto,
    this.rota,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: deviceSize.width,
        height: deviceSize.height / 13,
        // margin: const EdgeInsets.only(top: 5.0),
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceSize.width / 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(texto),
              if (viewall)
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      rota,
                    );
                  },
                  child: Row(
                    children: [
                      Text('VIEW ALL'),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
