import 'package:test/test.dart';
import 'integration_test/profile_team_edit_page.dart';

main() {
  testAll();
}

Future<void> testAll() async {
  group('TestCase:', () {
    profileTeamEditPage();
  });
}
