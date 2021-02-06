import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/profile/widget/profile_time_item.dart';
import 'package:provider/provider.dart';

class ProfileTimeScreen extends StatefulWidget {
  static const routeName = '/profileTimeScreen';
  @override
  _ProfileTimeScreenState createState() => _ProfileTimeScreenState();
}

class _ProfileTimeScreenState extends State<ProfileTimeScreen> {
  ProfileStore _profileStore;
  int id;
  @override
  void didChangeDependencies() {
    // _profileStore = Provider.of<ProfileStore>(context);
    // _profileStore.seed().whenComplete(() => _profileStore.loadProfile(2));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //     ),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        // ),
        // backgroundColor: Colors.grey[100],
        // ignore: missing_return
        // body: Observer(builder: (_) {
        // switch (_profileStore.profilesState) {
        //   case ProfileState.inicial:
        //   case ProfileState.carregando:
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   case ProfileState.carregado:
        //       return Center(
        //         child: Container(
        //           // width: MediaQuery.of(context).size.width / 1.07,
        //           child: CustomScrollView(
        //             slivers: <Widget>[
        //               SliverAppBar(
        //                 automaticallyImplyLeading: false,
        //                 elevation: 0,
        //                 backgroundColor: Colors.transparent,
        //                 leading: IconButton(
        //                   icon: Icon(
        //                     Icons.arrow_back,
        //                   ),
        //                   onPressed: () => Navigator.pop(context),
        //                 ),
        //                 floating: false,
        //                 centerTitle: true,
        //                 title: Text(_profileStore.usuario.full_name),
        //               ),
        //               SliverList(
        //                 delegate: SliverChildListDelegate([
        //                   ProfileTimeItem(_profileStore.usuario),
        //                 ]),
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //   }
        // }),
        );
  }
}
