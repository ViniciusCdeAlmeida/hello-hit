import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileProcuraScreen extends StatefulWidget {
  @override
  _ProfileProcuraScreenState createState() => _ProfileProcuraScreenState();
}

class _ProfileProcuraScreenState extends State<ProfileProcuraScreen> {
  bool checkboxValue = false;
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
                        controller: null,
                        onEditingComplete: null,
                        onChanged: null,
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
                        controller: null,
                        onEditingComplete: null,
                        onChanged: null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          RaisedButton(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: FlatButton(
                              onPressed: () {},
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
                                    'Unleash the power of our premium hiring tool and search engine.',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: RaisedButton(
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
              Observer(
                builder: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
