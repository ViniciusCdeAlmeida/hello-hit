import 'package:flutter/material.dart';

class UserFullPost extends StatefulWidget {
  UserFullPost({Key key}) : super(key: key);

  @override
  _UserFullPostState createState() => _UserFullPostState();
}

class _UserFullPostState extends State<UserFullPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        "assets/images/perfil_assets/foto_perfil_post.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'James Taylor',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
