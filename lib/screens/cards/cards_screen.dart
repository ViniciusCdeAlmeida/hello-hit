import 'package:flutter/material.dart';
import 'package:hellohit/screens/cards/widgets/credit_card.dart';

class CardsScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange[700],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: CreditCard(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState.validate()) {}
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[700],
      ),
    );
  }
}
