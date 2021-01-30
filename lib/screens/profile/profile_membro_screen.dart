import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/screens/profile/widget/profile_membro_item.dart';

class ProfileMembroScreen extends StatefulWidget {
  static const routeName = '/profileMembroScreen';
  @override
  _ProfileMembroScreenState createState() => _ProfileMembroScreenState();
}

class _ProfileMembroScreenState extends State<ProfileMembroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        leadingWidth: 15,
        // centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://z2r3u4a8.stackpathcdn.com/wp-content/uploads/2015/10/jogos-de-baisebal-no-petco-park-1024x599.jpg',
                    height: 40,
                    width: 40,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFE0651F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Team members',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Text(
                  'Members',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              ProfileMembroItem(),
              ProfileMembroItem(),
              ProfileMembroItem(),
              ProfileMembroItem(),
              ProfileMembroItem(),
            ],
          ),
        ),
      ),
    );
  }
}
