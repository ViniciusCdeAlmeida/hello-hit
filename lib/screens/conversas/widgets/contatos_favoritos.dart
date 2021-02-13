import 'package:flutter/material.dart';
import 'package:hellohit/models/message_model.dart';

class ContatosFavoritos extends StatelessWidget {
  const ContatosFavoritos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 5.0),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               'Contatos Favoritos',
    //               style: TextStyle(
    //                 color: Colors.orange[700],
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold,
    //                 letterSpacing: 1,
    //               ),
    //             ),
    //             IconButton(
    //               icon: Icon(Icons.more_horiz),
    //               iconSize: 30,
    //               color: Colors.orange[700],
    //               onPressed: () {},
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         height: 120,
    //         child: ListView.builder(
    //           padding: EdgeInsets.only(left: 10),
    //           scrollDirection: Axis.horizontal,
    //           itemCount: favorites.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Column(
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 25,
    //                     backgroundImage: AssetImage(favorites[index].imagem),
    //                   ),
    //                   SizedBox(
    //                     height: 6,
    //                   ),
    //                   Text(
    //                     favorites[index].nome,
    //                     style: TextStyle(
    //                       color: Colors.orange[700],
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
