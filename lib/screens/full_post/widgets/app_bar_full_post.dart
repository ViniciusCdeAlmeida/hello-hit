import 'package:flutter/material.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';

class AppBarFullPost extends StatelessWidget {
  const AppBarFullPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      //backgroundColor: Colors.white,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        child: Column(
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedScreen(),
                  ));
            },
          ),
        )
      ],
    );
  }
}
