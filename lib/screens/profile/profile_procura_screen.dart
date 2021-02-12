import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/search_model.dart';
import 'package:hellohit/providers/stores/search_store.dart';
import 'package:hellohit/screens/profile/widget/profile_talento_search_item.dart';
import 'package:hellohit/screens/profile/widget/profile_time_search_item.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_talento_screen.dart';
import 'package:provider/provider.dart';

class ProfileProcuraScreen extends StatefulWidget {
  static const routeName = '/profileProcuraScreen';
  @override
  _ProfileProcuraScreenState createState() => _ProfileProcuraScreenState();
}

class _ProfileProcuraScreenState extends State<ProfileProcuraScreen> {
  bool checkboxValue = false;
  int _radioValue = 0;

  SearchStore _searchStore;

  var _procura = Search();

  @override
  void didChangeDependencies() {
    _searchStore = Provider.of<SearchStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Search Talents',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop()),
            centerTitle: true,
            floating: true,
            snap: false,
            backgroundColor: Colors.deepOrange[600],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Text(
                        'SEARCH BY SKILL',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            top: 5,
                            left: 5,
                            bottom: 12,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        onChanged: (value) => _procura.skills = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Text(
                        'SEARCH BY PLACE',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            top: 5,
                            left: 5,
                            bottom: 12,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        onChanged: (value) => _procura.location = value,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _procura.teamOrUser = 'TEAM';
                                    _radioValue = value;
                                  });
                                }),
                            Text('Team'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _procura.teamOrUser = 'TALENT';
                                    _radioValue = value;
                                  });
                                }),
                            Text('Talent'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 3,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _procura.teamOrUser = 'TEAM';
                                    _radioValue = value;
                                  });
                                }),
                            Text('Opportunities'),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          RaisedButton(
                            onPressed: () {
                              if (_procura.teamOrUser == 'TEAM')
                                _searchStore.getTimes(_procura);
                              else
                                _searchStore.getTalentos(_procura);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              'SEARCH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            color: Colors.deepOrange,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: FlatButton(
                              onPressed: () => {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.black,
                              child: Text(
                                'ADVANCED SEARCH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'AVAILABILITY',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Available for contract',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 14.0,
                                            right: 14.0,
                                          ),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Checkbox(
                                              value: checkboxValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkboxValue = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Remote',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Willigness to move',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'JOB TYPE',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Sponsorship',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 14.0,
                                            right: 14.0,
                                          ),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Checkbox(
                                              value: checkboxValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkboxValue = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Full-time Job',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Part-time Job',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'EXPERIENCE LEVEL',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Student',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Checkbox(
                                            value: checkboxValue,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkboxValue = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Rookie',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 14.0,
                                            right: 14.0,
                                          ),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Checkbox(
                                              value: checkboxValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkboxValue = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Beginner',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 46.0,
                                            right: 14.0,
                                          ),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Checkbox(
                                              value: checkboxValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  checkboxValue = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Professional',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              checkboxValue = newValue;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Teacher',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Checkbox(
                                            value: checkboxValue,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkboxValue = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Coach',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'SEARCH BY EXPERIENCE',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              'Function',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 300,
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                  top: 5,
                                                  left: 5,
                                                  bottom: 12,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              controller: null,
                                              onEditingComplete: null,
                                              onChanged: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              'Team',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 300,
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                  top: 5,
                                                  left: 5,
                                                  bottom: 12,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              controller: null,
                                              onEditingComplete: null,
                                              onChanged: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              'School',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 300,
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                  top: 5,
                                                  left: 5,
                                                  bottom: 12,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              controller: null,
                                              onEditingComplete: null,
                                              onChanged: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'SEARCH',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white70,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // 'Unleash the power of our premium hiring tool and search engine.',
                                    'Coming Soon',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       vertical: 15.0),
                                  //   child: RaisedButton(
                                  //     onPressed: () => Navigator.of(context)
                                  //         .pushNamed(TelaExplicacaoTalentoScreen
                                  //             .routeName),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(15.0),
                                  //     ),
                                  //     child: Text(
                                  //       'SEARCH',
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: 12,
                                  //       ),
                                  //     ),
                                  //     color: Colors.deepOrange,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 8.0,
                ),
                child: Text(
                  'Talents and Teams',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              // ignore: missing_return
              Observer(builder: (_) {
                switch (_searchStore.searchState) {
                  case SearchState.inicial:
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text('No data'),
                      ),
                    );
                  case SearchState.carregando:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case SearchState.carregado:
                    if (_searchStore.talentos.length == 0 &&
                        _searchStore.times.length == 0)
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Search was not found'),
                        ),
                      );
                    else if (_searchStore.talentos.length != 0)
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _searchStore.talentos.length,
                          itemBuilder: (_, idx) => Column(
                            children: [
                              Observer(
                                builder: (_) {
                                  return ProfileTalentoSearchItem(
                                    _searchStore.talentos[idx],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    else if (_searchStore.times.length != 0)
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _searchStore.times.length,
                          itemBuilder: (_, idx) => Column(
                            children: [
                              Observer(
                                builder: (_) {
                                  return ProfileTimeSearchItem(
                                    _searchStore.times[idx],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                }
              })
            ]),
          ),
        ],
      ),
    );
  }
}
