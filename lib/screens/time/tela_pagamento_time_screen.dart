import 'dart:ui';

import 'package:flutter/material.dart';

class TelaPagamentoTimeScreen extends StatefulWidget {
  static const routeName = '/telaPagamentoTimeScreen';
  @override
  _TelaPagamentoTimeScreenState createState() =>
      _TelaPagamentoTimeScreenState();
}

class _TelaPagamentoTimeScreenState extends State<TelaPagamentoTimeScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFF2A65A),
                // Color(0xFF1976D2),
                Color(0xFF772F1A),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    height: deviceSize.height / 13,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFF2A65A),
                          // Color(0xFF1976D2),
                          Color(0xFF772F1A),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: deviceSize.height / 1.25,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: deviceSize.width / 7,
                right: deviceSize.width / 7,
                top: 10.0,
              ),
              child: Center(
                child: Card(
                  child: Column(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Create a new team (or',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' convert your account',
                                style: TextStyle(
                                  color: Colors.blue,
                                  // fontSize: 60,
                                ),
                              ),
                              TextSpan(
                                text: ' to a team)',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.width / 26,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            side: BorderSide(
                              width: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          elevation: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: deviceSize.height / 40,
                                  horizontal: deviceSize.width / 12,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Team (Small) ',
                                        style: TextStyle(
                                            color: Colors.blue[300],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(
                                          Icons.fiber_manual_record,
                                          size: 8,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' up to 3 members ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(
                                          Icons.fiber_manual_record,
                                          size: 8,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' \$144 ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'per year',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            Container(
                              width: deviceSize.width / 1.2,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  initialValue: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Team name',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {},
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                            Container(
                              width: deviceSize.width / 1.2,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  initialValue: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'username',
                                    helperText:
                                        'Your team URL: hellohit/username',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {},
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                            Container(
                              width: deviceSize.width / 1.2,
                              height: 95,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  initialValue: null,
                                  decoration: InputDecoration(
                                    helperMaxLines: 2,
                                    border: OutlineInputBorder(),
                                    labelText: 'Billing email',
                                    helperText:
                                        'We\'ll use the address to notify your team of billing and account changes.',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {},
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.blue[300],
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  final Size deviceSize;
  const DividerLine({
    Key key,
    this.deviceSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: deviceSize.width / 1.2,
        height: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.grey[100],
                Colors.grey[400],
                Colors.grey[100],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
