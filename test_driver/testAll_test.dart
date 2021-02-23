import 'package:test/test.dart';

import 'integration_test/login_page.dart';
import 'integration_test/register_page.dart';
import 'integration_test/drawer_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    loginPage();
    // registerPage();
    drawerPage();
  });
}
