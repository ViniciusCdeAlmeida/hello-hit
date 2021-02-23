import 'package:flutter_driver/driver_extension.dart';

import 'package:hellohit/main.dart' as app;

import 'mocks/mock_helper.dart';

Future<void> main() async {
  // ignore: missing_return
  Future<String> dataHandler(String msg) async {
    switch (msg) {
      case "login":
        {
          MockHelper.login();
        }
        break;
      case "register":
        {
          MockHelper.register();
        }
        break;
      default:
        break;
    }
  }

  enableFlutterDriverExtension(handler: dataHandler);

  app.main();
}
