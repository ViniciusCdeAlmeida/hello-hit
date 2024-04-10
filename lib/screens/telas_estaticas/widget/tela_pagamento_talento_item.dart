import 'package:flutter/material.dart';

class TelaPagamentoTalento extends StatefulWidget {
  static const routeName = '/telaPagamentoTalento';
  @override
  _TelaPagamentoTalentoState createState() => _TelaPagamentoTalentoState();
}

class _TelaPagamentoTalentoState extends State<TelaPagamentoTalento> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      width: deviceSize.width / 1.1,
                      height: deviceSize.height / 1.1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Premium',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffE0651F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Advanced Search Plan',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 60.0,
                              right: 60.0,
                              bottom: 10.0,
                            ),
                            child: Text(
                              'Our premium hiring search tool gives you the ability to search full-time hires, talents, or teams by specialty, location, experience level, and more.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                            width: deviceSize.width / 1.5,
                            height: deviceSize.height / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 10.0,
                                      ),
                                      child: ClipRRect(
                                        child: Image.asset(
                                          'assets/images/procurar_talentos_intro_assets/icone1.png',
                                          width: MediaQuery.of(context).size.width / 10,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text('Search now'),
                                  ],
                                ),
                                Text(
                                  'Talents:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('ARTS TALENTS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('SPORTS TALENTS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('EDUCATIONAL INSTITUTIONS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('SPORTS TEAMS'),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Teams:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('BRANDS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('COMPANIES'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('EDUCATIONAL INSTITUTIONS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('SPORTS TEAMS'),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Opportunities:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('JOBS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('SPONSORSHIPS'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text('SCHOLLARSHIPS'),
                                      ),
                                      Text('SPORTS TEAMS'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xFFE0651F),
                    onPressed: () {},
                    child: Text(
                      'SIGNUP NOW FOR \$',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
