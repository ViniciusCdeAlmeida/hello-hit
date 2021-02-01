import 'package:flutter/material.dart';

class ListCards extends StatelessWidget {
  List cards = [
    "Mastercard",
    "Visa black",
    "Visa black",
    "Mastercard",
    "Visa black",
    "Visa black"
  ];
  List numberCards = [
    "****8767",
    "****3467",
    "****9889",
    "****8767",
    "****3467",
    "****9889"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      color: Colors.green,
                      /*decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            image: AssetImage(''),
                                          ),
                                        ),*/
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cards[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          numberCards[index],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
