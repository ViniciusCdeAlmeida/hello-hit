import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Image.asset(
                                'assets/images/logos/Logo_hellohit_white.png'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          child: Column(
                            children: [
                              TextField(
                                autofocus: true,
                                cursorColor: Colors.deepOrange,
                                decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 16, 20, 16),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                cursorColor: Colors.deepOrange,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(32, 16, 32, 16),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RaisedButton(
                                child: const Text('LOGIN'),
                                padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                                textColor: Colors.orange[700],
                                onPressed: () {},
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Forgot my password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'NOT A MEMBER YET?',
                  style: TextStyle(
                    color: Color(0xffE0651F),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    child: const Text('REGISTER'),
                    textColor: Colors.white,
                    onPressed: () {},
                    color: Colors.orange[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
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
