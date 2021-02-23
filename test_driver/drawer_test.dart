import 'package:test/test.dart';

import 'integration_test/drawer_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    drawerPage();
  });
}
