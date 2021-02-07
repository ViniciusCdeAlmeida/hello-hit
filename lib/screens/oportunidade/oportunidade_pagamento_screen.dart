import 'package:flutter/material.dart';

class OportunidadePagamentoScreen extends StatefulWidget {
  static const routeName = '/oportunidadePagamentoScreen';
  @override
  _OportunidadePagamentoScreenState createState() =>
      _OportunidadePagamentoScreenState();
}

class _OportunidadePagamentoScreenState
    extends State<OportunidadePagamentoScreen> {
  int _radioValue = 0;

  String cartao;
  String mes;
  String ano;
  String cvv;
  String postal;

  void makePayment(
    String cartao,
    String mes,
    String ano,
    String cvv,
    String postal,
  ) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Center(
                  child: Text(
                    'You\'re one step away from finding your dream hire',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                }),
                            Text('Bill monthly \$399/mo'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                }),
                            Text('Bill quartely \$299/mo'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio(
                                value: 3,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                }),
                            Text('Bill yearly \$199/mo'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'PAYMENT INFORMATION',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        width: 0,
                        color: Colors.grey[500],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: TextField(
                      maxLengthEnforced: true,
                      maxLength: 30,
                      maxLines: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          bottom: 12,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Postal/ZIP Code',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        width: 0,
                        color: Colors.grey[500],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: TextField(
                      maxLengthEnforced: true,
                      maxLength: 30,
                      maxLines: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          bottom: 12,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      controller: null,
                      onEditingComplete: null,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Expiration',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3,
                        padding: const EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey[500],
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: TextField(
                          maxLengthEnforced: true,
                          maxLength: 30,
                          maxLines: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Month',
                            contentPadding: const EdgeInsets.only(
                              top: 5,
                              left: 5,
                              bottom: 12,
                            ),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: false,
                          ),
                          onChanged: (value) {
                            mes = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          padding: const EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[500],
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                          child: TextField(
                            maxLengthEnforced: true,
                            maxLength: 30,
                            maxLines: 1,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Year',
                              contentPadding: const EdgeInsets.only(
                                top: 5,
                                left: 5,
                                bottom: 12,
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            onChanged: (value) {
                              ano = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                          width: 0,
                          color: Colors.grey[500],
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: TextField(
                        maxLengthEnforced: true,
                        maxLength: 4,
                        maxLines: 1,
                        keyboardType: TextInputType.numberWithOptions(
                          signed: false,
                          decimal: false,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'CVV',
                          contentPadding: const EdgeInsets.only(
                            top: 5,
                            left: 5,
                            bottom: 12,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          cvv = value;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          'Subtotal',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          '\$399.00',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          'Total billed today',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          '\$399.00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'All prices are in USD and all sales are final. You will be charged \$399.00 every 30 days while this subscription is active. Cancel any time.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: RaisedButton(
                      onPressed: () => makePayment(
                        cartao,
                        mes,
                        ano,
                        cvv,
                        postal,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Text(
                        'Buy Job Board',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blueGrey[400],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
