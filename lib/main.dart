import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hellohit/screens/splash/base_screen.dart';
import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main() {
  // Socket socket = io(
  //     'http://3.16.49.191:3000',
  //     OptionBuilder()
  //         .setTransports(['websocket']) // for Flutter or Dart VM
  //         .disableAutoConnect() // disable auto-connection
  //         .setExtraHeaders({'foo': 'bar'}) // optional
  //         .build());
  // socket.connect();

// await DotEnv.load(fileName: '.env');
  // openBox();
  runApp(MyApp());
}

// Future<void> openBox() async {
//   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDir.path);
//   await Hive.openBox('tokenBox');
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: 'HelloHit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionColor: Colors.white,
          primaryColor: Colors.orange[700],
          toggleableActiveColor: const Color(0xFF2247C7),
          errorColor: const Color(0xFF7A1C02),
          fontFamily: 'Lato',
        ),
        home: BaseScreen(),
        routes: rotas(),
      ),
    );
  }
}
