import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  profileTeamPage();
}

Future<void> profileTeamPage() async {
  FlutterDriver driver;

  final backPageChat = find.byValueKey(Keys.backPageChatScreen);
  final introScreen = find.byValueKey(Keys.introScreen);
  final emailField = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passField = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);
  final profileButton = find.byValueKey(Keys.feedScreen.profileFeedScreen);
  final makeHit = find.byValueKey(Keys.profileTeam.makeHitProfileTeamScreen);
  final beFan = find.byValueKey(Keys.profileTeam.beFanProfileTeamScreen);
  final goInbox = find.byValueKey(Keys.profileTeam.inboxProfileTeamScreen);
  final myPostsTab = find.byValueKey(Keys.profileTeam.myPostsTabProfileTeamScreen);
  final myFansTab = find.byValueKey(Keys.profileTeam.myFansTabProfileTeamScreen);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('In app ->', () {
    test('Enter in app', () async {
      sleep(Duration(seconds: 5));
      await driver.tap(introScreen);
      await driver.tap(emailField);
      await driver.enterText('ut@u.com');
      await driver.tap(passField);
      await driver.enterText('1234567a-');
      await driver.tap(loginButton);
    });
    test('Enter in my profile', () async {
      await driver.tap(profileButton);
    });
    //602f10d235e4092afc6442bc
    // driver.tap(find.byValueKey('${Keys.feedScreen.commentIconFeedScreen}_602f10d235e4092afc6442bc'));
    //602549339de88834446ba2bd
    test('Make hit', () async {
      await driver.tap(makeHit);
      sleep(Duration(seconds: 10));
      await driver.tap(makeHit);
      expect(await driver.getText(find.text('You removed your hit.')), 'You removed your hit.');
      sleep(Duration(seconds: 10));
    });
    test('Enter Inbox', () async {
      await driver.tap(goInbox);
      await driver.tap(backPageChat);
    });
    test('Make fan', () async {
      await driver.tap(beFan);
      sleep(Duration(seconds: 10));
      await driver.tap(beFan);
      expect(await driver.getText(find.text('You removed your fan.')), 'You removed your fan.');
    });

    test('Scroll to tab', () async {
      await driver.scrollIntoView(myPostsTab);
      await driver.tap(myFansTab);
      await driver.tap(myPostsTab);
    }, timeout: Timeout.none);

    test('Go to post comments', () async {
      driver.tap(find.byValueKey('${Keys.profileTeam.myPostsProfileTeamScreen}_602549339de88834446ba2bd'));
      await driver.tap(find.pageBack());
    }, timeout: Timeout.none);
  });
}
