import 'package:test/test.dart';
import 'integration_test/register_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    registerPage();
  });
}
