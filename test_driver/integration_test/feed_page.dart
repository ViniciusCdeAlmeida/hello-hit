import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  feedPage();
}

Future<void> feedPage() async {
  FlutterDriver driver;

  final feedScroll = find.byValueKey(Keys.feedScreen.drawerFeedScreen);
  final introScreen = find.byValueKey(Keys.introScreen);
  final emailField = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passField = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);
  final actionButton = find.byValueKey(Keys.feedScreen.actionsFeedScreen);
  final deleteOkPost = find.byValueKey(Keys.feedScreen.deleteOkPostFeedScreen);
  final deleteCancelPost = find.byValueKey(Keys.feedScreen.deleteCancelPostFeedScreen);
  final deletePost = find.byValueKey(Keys.feedScreen.deletePostFeedScreen);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('In feed Page ->', () {
    test('Enter in feed page', () async {
      sleep(Duration(seconds: 5));
      await driver.tap(introScreen);
      await driver.tap(emailField);
      await driver.enterText('ut@u.com');
      await driver.tap(passField);
      await driver.enterText('1234567a-');
      await driver.tap(loginButton);
    });
    test('Actions in Post', () async {
      await driver.tap(actionButton);
      await driver.tap(deletePost);
      await driver.tap(deleteCancelPost);

      // await driver.tap(actionButton);
      // await driver.tap(deletePost);
      // await driver.tap(deleteOkPost);
    });
    //602f10d235e4092afc6442bc
    // driver.tap(find.byValueKey('${Keys.feedScreen.commentIconFeedScreen}_602f10d235e4092afc6442bc'));
    //
    test('Make hit', () async {
      await driver.scroll(
        feedScroll,
        0,
        -200,
        Duration(seconds: 2),
      );
      await driver.tap(find.byValueKey('${Keys.feedScreen.makeHitFeedScreen}_602f10d235e4092afc6442bc'));
      sleep(Duration(seconds: 10));
      await driver.tap(find.byValueKey('${Keys.feedScreen.makeHitFeedScreen}_602f10d235e4092afc6442bc'));
      expect(await driver.getText(find.text('A post owner cannot give a hit to himself.')),
          'A post owner cannot give a hit to himself.');
    });
    test('Enter comments', () async {
      await driver.scroll(
        feedScroll,
        0,
        -100,
        Duration(seconds: 2),
      );
      await driver.tap(find.byValueKey('${Keys.feedScreen.commentFeedScreen}_602f10d235e4092afc6442bc'));
      await driver.tap(find.pageBack());
      await driver.tap(find.byValueKey('${Keys.feedScreen.commentIconFeedScreen}_602f10d235e4092afc6442bc'));
      await driver.tap(find.pageBack());
    });

    test('Scroll feed page', () async {
      await driver.scroll(
        feedScroll,
        0,
        -8000,
        Duration(seconds: 25),
      );
    }, timeout: Timeout.none);
  });
}
