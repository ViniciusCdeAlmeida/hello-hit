import 'package:test/test.dart';
import 'integration_test/profile_team_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    profileTeamPage();
  });
}
