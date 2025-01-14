import 'package:flutter/material.dart';
import 'package:hellohit/screens/camera.dart';

import 'package:provider/provider.dart';
import 'package:hellohit/screens/splash/base_screen.dart';
import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
// import 'package:path_provider/path_provider.dart' as syspath;

Future<void> main() async {
  // var path1 = syspath.StorageDirectory.pictures.toString();
  // var path2 = syspath.StorageDirectory.pictures;
  // var path3 = syspath.getApplicationDocumentsDirectory();
  // var directory = await syspath.getExternalStorageDirectories(
  //     type: syspath.StorageDirectory.pictures);
  // final myImagePath = '${directory.first.path}/HelloHit';
  // Directory dic;
  // final myImgDir = await Directory(myImagePath).create();
  // print('object');

  await DotEnv.load(fileName: '.env');
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
        home: CameraExampleHome(),
        routes: rotas(),
      ),
    );
  }
}
