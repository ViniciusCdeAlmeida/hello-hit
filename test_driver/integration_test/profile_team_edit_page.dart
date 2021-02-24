import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:hellohit/utils/keys.dart';

main() {
  profileTeamEditPage();
}

Future<void> profileTeamEditPage() async {
  FlutterDriver driver;

  final introScreen = find.byValueKey(Keys.introScreen);
  final emailField = find.byValueKey(Keys.loginScreen.emailFormScreen);
  final passField = find.byValueKey(Keys.loginScreen.passwordFormScreen);
  final loginButton = find.byValueKey(Keys.loginScreen.loginButtonLoginScreen);
  final openDrawer = find.byValueKey(Keys.drawer.openDrawer);
  final editProfileDrawer = find.byValueKey(Keys.drawer.editProfileDrawer);
  final nameField = find.byValueKey(Keys.profileTeamEdit.nameEditProfileTeamScreen);
  final siteField = find.byValueKey(Keys.profileTeamEdit.siteEditProfileTeamScreen);
  final locationField = find.byValueKey(Keys.profileTeamEdit.locationEditProfileTeamScreen);
  final bioField = find.byValueKey(Keys.profileTeamEdit.bioEditProfileTeamScreen);

  final workFulltimeField = find.byValueKey(Keys.profileTeamEdit.workFulltimeEditProfileTeamScreen);
  final workFreeField = find.byValueKey(Keys.profileTeamEdit.workFreelanceEditProfileTeamScreen);
  final workSponsField = find.byValueKey(Keys.profileTeamEdit.workSponsEditProfileTeamScreen);

  final saveBtn = find.byValueKey(Keys.profileTeamEdit.saveEditProfileTeamScreen);

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
    test('Edit my profile -> Name', () async {
      await driver.tap(openDrawer);
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(nameField);
      await driver.tap(nameField);
      await driver.enterText('name 1');
      expect(await driver.getText(find.text('name 1')), 'name 1');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });

    test('Edit my profile -> Location', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(locationField);
      await driver.tap(locationField);
      await driver.enterText('location 1');
      expect(await driver.getText(find.text('location 1')), 'location 1');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });
    test('Edit my profile -> Site', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(siteField);
      await driver.tap(siteField);
      await driver.enterText('site 1');
      expect(await driver.getText(find.text('site 1')), 'site 1');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });
    test('Edit my profile -> Bio', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(bioField);
      await driver.tap(bioField);
      await driver.enterText('bio 1');
      expect(await driver.getText(find.text('bio 1')), 'bio 1');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });
    test('Edit my profile -> Award', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(find.byValueKey('${Keys.profileTeamEdit.awardNameEditProfileTeamScreen}_0'));
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.awardNameEditProfileTeamScreen}_0'));
      await driver.enterText('award name 1');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.awardDescEditProfileTeamScreen}_0'));
      await driver.enterText('award desc 1');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.awardMonthEditProfileTeamScreen}_0'));
      await driver.enterText('01');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.awardYearEditProfileTeamScreen}_0'));
      await driver.enterText('2021');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });
    test('Edit my profile -> Job', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(find.byValueKey('${Keys.profileTeamEdit.jobRoleEditProfileTeamScreen}_0'));
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobRoleEditProfileTeamScreen}_0'));
      await driver.enterText('job role 1');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobCompEditProfileTeamScreen}_0'));
      await driver.enterText('job comp 1');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobMonthTEditProfileTeamScreen}_0'));
      await driver.enterText('03');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobYearTEditProfileTeamScreen}_0'));
      await driver.enterText('2019');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobMonthFEditProfileTeamScreen}_0'));
      await driver.enterText('04');
      await driver.tap(find.byValueKey('${Keys.profileTeamEdit.jobYearFEditProfileTeamScreen}_0'));
      await driver.enterText('2020');

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });
    test('Edit my profile -> Work', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(workFulltimeField);
      await driver.tap(workFulltimeField);
      await driver.tap(workFreeField);
      await driver.tap(workSponsField);

      await driver.scrollIntoView(saveBtn);
      await driver.tap(saveBtn);
    });

    test('Edit my profile -> Check edited fields', () async {
      await driver.tap(editProfileDrawer);
      await driver.scrollIntoView(nameField);
      // expect(await driver.getText(find.text('name 1')), 'name 1');
      expect(await driver.getText(find.text('location 1')), 'location 1');
      expect(await driver.getText(find.text('site 1')), 'site 1');
      expect(await driver.getText(find.text('bio 1')), 'bio 1');
      await driver.scrollIntoView(find.byValueKey('${Keys.profileTeamEdit.awardNameEditProfileTeamScreen}_0'));
      expect(await driver.getText(find.text('award name 1')), 'award name 1');
      expect(await driver.getText(find.text('award desc 1')), 'award desc 1');
      expect(await driver.getText(find.text('01')), '01');
      expect(await driver.getText(find.text('2021')), '2021');
      await driver.scrollIntoView(find.byValueKey('${Keys.profileTeamEdit.jobRoleEditProfileTeamScreen}_0'));
      expect(await driver.getText(find.text('job role 1')), 'job role 1');
      expect(await driver.getText(find.text('job comp 1')), 'job comp 1');
      expect(await driver.getText(find.text('03')), '03');
      expect(await driver.getText(find.text('2019')), '2019');
      expect(await driver.getText(find.text('04')), '04');
      expect(await driver.getText(find.text('2020')), '2020');
    });
  });
}
