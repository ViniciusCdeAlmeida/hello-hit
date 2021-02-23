import 'package:test/test.dart';

import 'integration_test/feed_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    feedPage();
  });
}
