import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hellohit/screens/cards/widgets/card_back.dart';
import 'package:hellohit/screens/cards/widgets/card_front.dart';

class CreditCard extends StatelessWidget {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlipCard(
            key: cardKey,
            direction: FlipDirection.HORIZONTAL,
            speed: 780,
            flipOnTouch: false,
            front: CardFront(),
            back: CardBack(),
          ),
          FlatButton(
            onPressed: () {
              cardKey.currentState.toggleCard();
            },
            textColor: Colors.orange[700],
            padding: EdgeInsets.zero,
            child: const Text('Virar Cartão'),
          ),
        ],
      ),
    );
  }
}
