import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  loginPage();
}

Future<void> loginPage() async {
  FlutterDriver driver;

  final introScreen = find.byValueKey(Keys.introScreen);
  final forgotPassButton = find.byValueKey(Keys.loginScreen.forgotPasswordButtonLoginScreen);
  final resendPassButton = find.byValueKey(Keys.loginScreen.resendEmailButtonLoginScreen);
  final emailField = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passField = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);
  final okFailButton = find.byValueKey(Keys.erroMenssages.erroUserLogin);
  final registerButton = find.byValueKey(Keys.loginScreen.registerLoginButtonLoginScreen);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Go to login Page ->', () {
    test('In login Page', () async {
      sleep(Duration(seconds: 5));
      await driver.tap(introScreen);
    });
  });

  group('In login Page ->', () {
    // test('Go to forgot password', () async {
    //   await driver.tap(forgotPassButton);
    //   sleep(Duration(seconds: 3));
    // });
    // test('Go to resend email', () async {
    //   await driver.tap(resendPassButton);
    //   sleep(Duration(seconds: 3));
    // });
    test('Login Fail - User not found', () async {
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(passField);
      await driver.enterText('FF');
      await driver.tap(loginButton);
      await driver.tap(okFailButton);
    });
    test('Login Fail - Password incorrect', () async {
      await driver.tap(emailField);
      await driver.enterText('uu@u.com');
      await driver.tap(passField);
      await driver.enterText('FF');
      await driver.tap(loginButton);
      await driver.tap(okFailButton);
    });
    test('Login Successful', () async {
      await driver.tap(emailField);
      await driver.enterText('uu@u.com');
      await driver.tap(passField);
      await driver.enterText('1234567a-');
      await driver.tap(loginButton);
    });
  });
}
