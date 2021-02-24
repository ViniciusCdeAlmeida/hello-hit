import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  drawerPage();
}

Future<void> drawerPage() async {
  FlutterDriver driver;

  final openDrawer = find.byValueKey(Keys.drawer.openDrawer);
  final closeDrawer = find.byValueKey(Keys.drawer.closeDrawer);
  final bookmarksDrawer = find.byValueKey(Keys.drawer.bookmarksDrawer);
  final turnProDrawer = find.byValueKey(Keys.drawer.turnProDrawer);
  final myTeamsDrawer = find.byValueKey(Keys.drawer.myTeamsDrawer);
  final notificationDrawer = find.byValueKey(Keys.drawer.notificationDrawer);
  final opportunitiesDrawer = find.byValueKey(Keys.drawer.opportunitiesDrawer);
  final battleDrawer = find.byValueKey(Keys.drawer.battleDrawer);
  final editProfileDrawer = find.byValueKey(Keys.drawer.editProfileDrawer);
  final statisticsDrawer = find.byValueKey(Keys.drawer.statisticsDrawer);
  final talentsShowDrawer = find.byValueKey(Keys.drawer.talentsShowDrawer);
  final logoutDrawer = find.byValueKey(Keys.drawer.logoutDrawer);
  final helpExpandDrawer = find.byValueKey(Keys.drawer.helpExpandDrawer);
  final helpCenterHelpDrawer = find.byValueKey(Keys.drawer.helpCenterHelpDrawer);
  final helpSupportInbDrawer = find.byValueKey(Keys.drawer.helpSupportInbDrawer);
  final helpReportProbDrawer = find.byValueKey(Keys.drawer.helpReportProbDrawer);
  final helpTermsDrawer = find.byValueKey(Keys.drawer.helpTermsDrawer);
  final settingsExpandDrawer = find.byValueKey(Keys.drawer.settingsExpandDrawer);
  final settingsDrawer = find.byValueKey(Keys.drawer.settingsDrawer);
  final settingsPrivateDrawer = find.byValueKey(Keys.drawer.settingsPrivateDrawer);
  final settingsLanguageDrawer = find.byValueKey(Keys.drawer.settingsLanguageDrawer);
  final helloHitPayDrawer = find.byValueKey(Keys.drawer.helloHitPayDrawer);
  final backButtonEditProfileTalent = find.byValueKey(Keys.profileTalentEdit.backButtonEditProfileTalentScreen);

  final introScreen = find.byValueKey(Keys.introScreen);
  final emailField = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passField = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('In Drawer Page ->', () {
    test('Open drawer and close', () async {
      sleep(Duration(seconds: 5));
      await driver.tap(introScreen);
      await driver.tap(emailField);
      await driver.enterText('uu@u.com');
      await driver.tap(passField);
      await driver.enterText('1234567a-');
      await driver.tap(loginButton);
      await driver.tap(openDrawer);
      await driver.tap(closeDrawer);
      await driver.tap(openDrawer);
      sleep(Duration(seconds: 1));
    });
    test('Go to Turn Pro', () async {
      await driver.tap(turnProDrawer);
    });
    test('Go to Bookmarks', () async {
      await driver.tap(bookmarksDrawer);
    });
    test('Go to My Teams', () async {
      await driver.tap(myTeamsDrawer);
    });
    test('Go to Notification', () async {
      await driver.tap(notificationDrawer);
    });
    test('Go to Opportunities', () async {
      await driver.tap(opportunitiesDrawer);
    });
    test('Go to Battle rounds', () async {
      await driver.tap(battleDrawer);
    });
    test('Go to Edit Profile', () async {
      await driver.tap(editProfileDrawer);
      await driver.tap(backButtonEditProfileTalent);
    });
    test('Go to HelloHit Pay', () async {
      await driver.tap(helloHitPayDrawer);
    });
    test('Go to Statitics', () async {
      await driver.tap(statisticsDrawer);
    });
    test('Go to Talents Show', () async {
      await driver.tap(talentsShowDrawer);
    });

    test('Go to Help & Support', () async {
      await driver.scrollIntoView(helpExpandDrawer);
      await driver.tap(helpExpandDrawer);
    });
    test('Go to Help & Support -> Go to Help Center', () async {
      await driver.scrollIntoView(helpTermsDrawer);
    });
    test('Go to Help & Support -> Go to Support Inbox', () async {
      await driver.tap(helpSupportInbDrawer);
    });
    test('Go to Help & Support -> Go to Report a problem', () async {
      await driver.tap(helpReportProbDrawer);
    });
    test('Go to Help & Support -> Go to Terms & Policies', () async {
      await driver.tap(helpTermsDrawer);
      await driver.tap(helpCenterHelpDrawer);
    });

    test('Go to Settings & Privacy', () async {
      await driver.tap(settingsExpandDrawer);
      await driver.scrollIntoView(settingsExpandDrawer);
    });
    test('Go to Settings & Privacy -> Go to Settings', () async {
      await driver.tap(settingsDrawer);
    });
    test('Go to Settings & Privacy -> Go to Private Shortcuts', () async {
      await driver.tap(settingsPrivateDrawer);
    });
    test('Go to Settings & Privacy -> Go to App Language', () async {
      await driver.tap(settingsLanguageDrawer);
    });

    test('Logout', () async {
      await driver.scrollIntoView(logoutDrawer);
      await driver.tap(logoutDrawer);
      sleep(Duration(seconds: 1));
    });
  });
}
