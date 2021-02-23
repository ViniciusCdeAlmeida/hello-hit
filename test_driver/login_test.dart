import 'package:test/test.dart';

import 'integration_test/login_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    loginPage();
  });
}
