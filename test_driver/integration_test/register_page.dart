import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  registerPage();
}

Future<void> registerPage() async {
  FlutterDriver driver;

  final nameField = find.byValueKey(Keys.registerScreen.fullnameFormRegister);
  final emailField = find.byValueKey(Keys.registerScreen.emailFormRegister);
  final usernameField = find.byValueKey(Keys.registerScreen.usernameFormRegister);
  final passwordField = find.byValueKey(Keys.registerScreen.passwordFormRegister);
  final usertypeField = find.byValueKey(Keys.registerScreen.usertypeFormRegister);
  final passwordconfirmField = find.byValueKey(Keys.registerScreen.passwordconfirmFormRegister);
  final finalizeButton = find.byValueKey(Keys.registerScreen.finalizeFormRegister);
  final registerButton = find.byValueKey(Keys.loginScreen.registerLoginButtonLoginScreen);

  final introScreen = find.byValueKey(Keys.introScreen);
  final emailLogin = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passLogin = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('In register Page ->', () {
    test('Register without data', () async {
      sleep(Duration(seconds: 5));
      await driver.tap(introScreen);
      await driver.tap(registerButton);
      await driver.tap(finalizeButton);
    });
    test('Register without usertype', () async {
      await driver.tap(nameField);
      await driver.enterText('FF');
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(usernameField);
      await driver.enterText('FF');
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a-');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(
          await driver.getText(find.text('Choose your user as talent or team')), 'Choose your user as talent or team');
    });
    test('Register without name', () async {
      await driver.tap(nameField);
      await driver.enterText('');
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(usernameField);
      await driver.enterText('FF');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a-');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(await driver.getText(find.text('Choose one')), 'Choose one');
    });
    test('Register without email', () async {
      await driver.tap(nameField);
      await driver.enterText('FF');
      await driver.tap(emailField);
      await driver.enterText('');
      await driver.tap(usernameField);
      await driver.enterText('FF');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a-');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(await driver.getText(find.text('Choose one')), 'Choose one');
    });
    test('Register without username', () async {
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(nameField);
      await driver.enterText('FF');
      await driver.tap(usernameField);
      await driver.enterText('');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a-');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(await driver.getText(find.text('Choose one')), 'Choose one');
    });

    test('Register without password', () async {
      await driver.tap(nameField);
      await driver.enterText('FF');
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(usernameField);
      await driver.enterText('FF');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('');
      await driver.tap(passwordconfirmField);
      await driver.enterText('');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(await driver.getText(find.text('Password not correct')), 'Password not correct');
    });
    test('Register without password confirmation', () async {
      await driver.tap(nameField);
      await driver.enterText('FF');
      await driver.tap(emailField);
      await driver.enterText('FF');
      await driver.tap(usernameField);
      await driver.enterText('FF');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a');

      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      expect(await driver.getText(find.text('Password must be equal')), 'Password must be equal');
    });
    test('Register Successful', () async {
      await driver.tap(nameField);
      await driver.enterText('tester');
      await driver.tap(emailField);
      await driver.enterText('tester@tester.com');
      await driver.tap(usernameField);
      await driver.enterText('tester1');
      await driver.tap(usertypeField);
      await driver.tap(find.text('Talent or Fan'));
      await driver.tap(passwordField);
      await driver.enterText('1234567a-');
      await driver.tap(passwordconfirmField);
      await driver.enterText('1234567a-');
      await driver.scrollIntoView(finalizeButton);
      await driver.tap(finalizeButton);
      sleep(Duration(seconds: 5));

      // await driver.scrollIntoView(finalizeButton);
      // await driver.tap(finalizeButton);
      // sleep(Duration(seconds: 10));
    });
  });
}
