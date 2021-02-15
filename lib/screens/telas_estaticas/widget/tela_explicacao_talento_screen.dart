import 'package:flutter/material.dart';

class TelaExplicacaoTalentoScreen extends StatefulWidget {
  static const routeName = '/telaExplicacaoTalentoScreen';
  @override
  _TelaExplicacaoTalentoScreenState createState() =>
      _TelaExplicacaoTalentoScreenState();
}

class _TelaExplicacaoTalentoScreenState
    extends State<TelaExplicacaoTalentoScreen> {
  int _radioValue = 0;
  String _valorPacote = '29.90';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            expandedHeight: 370,
            flexibleSpace: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/procurar_talentos_intro_assets/banner_superior.png',
                    // height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned.fill(
                  top: 70,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Reach millions of professional and amateur athletes and artists.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          shadows: [
                            Shadow(
                              offset: Offset(0.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 70,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'FIND CANDIDATES',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Center(
                      child: Text(
                        'A plataform tailored to your needs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/procurar_talentos_intro_assets/separadores.png',
                        // height: 200,
                        width: MediaQuery.of(context).size.width / 7,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/images/procurar_talentos_intro_assets/icone1.png',
                              // height: 200,
                              width: MediaQuery.of(context).size.width / 8,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            'Find and contact talent who are open to new opportunities in your area.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/images/procurar_talentos_intro_assets/icone2.png',
                              // height: 200,
                              width: MediaQuery.of(context).size.width / 8,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            'Post on the world\'s # 1 board to hire arts and sports professionals.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/images/procurar_talentos_intro_assets/icone3.png',
                              // height: 200,
                              width: MediaQuery.of(context).size.width / 8,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            'Leave the source, verification, correspondece, disclosure, screen and pre-interview for our hight quality service.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: Color(0xFFE0651F),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Choose one of the plans below and enjoy all the features of our platform.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Radio(
                        //             value: 0,
                        //             groupValue: _radioValue,
                        //             onChanged: (value) {
                        //               setState(() {
                        //                 _radioValue = value;
                        //               });
                        //             }),
                        //         Text('Basic Search'),
                        //       ],
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(right: 8.0),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: Color(0xFFE0651F),
                        //           borderRadius: const BorderRadius.all(
                        //             Radius.circular(4),
                        //           ),
                        //           border: Border.all(
                        //             color: Colors.transparent,
                        //             width: 0,
                        //           ),
                        //         ),
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 15.0),
                        //           child: Text(
                        //             '\$19 / month',
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _valorPacote = '29.90';
                                        _radioValue = value;
                                      });
                                    }),
                                Text('Advanced Search'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0651F),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    '\$29.90 / month',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _valorPacote = '100';
                                        _radioValue = value;
                                      });
                                    }),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Post Vacancy',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0651F),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    '\$100 / month',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 10.0,
                        //     vertical: 10.0,
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'DISCOUNT PACKAGE',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 10.0),
                        //         child: Container(
                        //           height: 2.0,
                        //           width:
                        //               MediaQuery.of(context).size.width / 2.4,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 10.0,
                          ),
                          child: Text(
                            'Interested in acquiring talent? Select a plan above to get started today!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: Color(0xFFE0651F),
                          onPressed: () {},
                          child: Text(
                            'BUY NOW FOR \$ $_valorPacote / MONTH',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'SEARCH RESOURCES',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Unlimited messages',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Unlimited Search Results',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Private Lists',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Skills and location search',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Advanced Search Options',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Search using custom operators',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Save Searches',
                          corIcon: Color(0xFFE0651F),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'VACANT RESOURCES',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Vacancies notice board',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Exchange jobs anytime',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: 'Fill in multiple monthly positions',
                          corIcon: Color(0xFFE0651F),
                        ),
                        BannerRow(
                          icon: Icons.check_circle,
                          texto: '2.5k Average Cliks per Job List',
                          corIcon: Color(0xFFE0651F),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class BannerRow extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color corIcon;
  final Color corFonte;

  const BannerRow({
    Key key,
    this.icon,
    this.texto,
    this.corIcon,
    this.corFonte,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  icon,
                  color: corIcon,
                ),
              ),
              Text(
                texto,
                style: TextStyle(
                  fontSize: 14,
                  color: corFonte,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
