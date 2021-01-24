import 'dart:ui';

import 'package:flutter/material.dart';

class TelaPagamentoProItem extends StatefulWidget {
  @override
  _TelaPagamentoProItemState createState() => _TelaPagamentoProItemState();
}

class _TelaPagamentoProItemState extends State<TelaPagamentoProItem> {
  List<DropdownMenuItem<int>> t = [
    DropdownMenuItem<int>(
      value: 1,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 2,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 3,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 4,
      child: Text('data'),
      onTap: () {},
    ),
  ];
  bool anual = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 1.1,
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
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 20.0,
              ),
              child: Center(
                child: Card(
                  child: Column(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Go Pro',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Go Pro'),
                      ),
                      DividerLine(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select a payment frequency:',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              4,
                            ),
                          ),
                          side: BorderSide(width: 1, color: Colors.grey[300]),
                        ),
                        elevation: anual ? 3 : 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Annualy',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '\$',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        TextSpan(
                                          text: '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 60,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\/mo',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Billed once annualy at \$60.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 18.0,
                                  bottom: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Cancel any time.',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              anual
                                  ? Container(
                                      width: 300.0,
                                      padding: const EdgeInsets.all(8.0),
                                      child: OutlineButton(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.green[300],
                                        ),
                                        onPressed: () {
                                          mudaPlano(true);
                                        },
                                        child: Text(
                                          'Select',
                                          style: TextStyle(
                                            color: Colors.green[300],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width: 300.0,
                                      child: RaisedButton(
                                        onPressed: () {
                                          mudaPlano(false);
                                        },
                                        color: Colors.green,
                                        child: Text(
                                          'Select',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              4,
                            ),
                          ),
                          side: BorderSide(width: 1, color: Colors.grey[300]),
                        ),
                        elevation: anual ? 0 : 3,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Monthly',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '\$',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        TextSpan(
                                          text: '12',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 60,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\/mo',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Billed every month',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 18.0,
                                  bottom: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Cancel any time.',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              !anual
                                  ? Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width: 300.0,
                                      child: OutlineButton(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.green[300],
                                        ),
                                        onPressed: () {
                                          mudaPlano(true);
                                        },
                                        child: Text(
                                          'Select',
                                          style: TextStyle(
                                            color: Colors.green[300],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width: 300.0,
                                      child: RaisedButton(
                                        onPressed: () {
                                          mudaPlano(false);
                                        },
                                        color: Colors.green,
                                        child: Text('Select'),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      DividerLine(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 8.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Your total for today: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\$144.60',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' \$60',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ( -59% )',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Your next bill will be on January 3, 2021',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DividerLine(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  initialValue: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Card Number',
                                    hintText: 'xxxx-xxxx-xxxx-xxxx',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {},
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Expiration date:'),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: DropdownButtonFormField(
                                    hint: Text('Year'),
                                    items: t,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: DropdownButtonFormField(
                                    hint: Text('Month'),
                                    items: t,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    // decoration: const InputDecoration(
                                    //   border: const OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                              ),
                              Form(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.0,
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextFormField(
                                      textAlignVertical: TextAlignVertical.top,
                                      initialValue: null,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'CVV',
                                      ),
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        signed: false,
                                        decimal: false,
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (_) {},
                                      onSaved: (value) {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Form(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.top,
                                  initialValue: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Postal / ZIP Code',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {},
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 100.0,
                                minHeight: 40.0,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Purchase Pro",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
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

  void mudaPlano(bool value) {
    anual = value;
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
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

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              minHeight: 40.0,
            ),
            alignment: Alignment.center,
            child: Text(
              "Select",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
