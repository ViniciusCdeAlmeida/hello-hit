import 'dart:ui';

import 'package:flutter/material.dart';

class TimesOportunidadesScreen extends StatefulWidget {
  static const routeName = '/timesOportunidadesScreen';
  @override
  _TimesOportunidadesScreenState createState() =>
      _TimesOportunidadesScreenState();
}

class _TimesOportunidadesScreenState extends State<TimesOportunidadesScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                          Divider(),
                          ContainerData(deviceSize: deviceSize),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                        Divider(),
                        ContainerData(deviceSize: deviceSize),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          headerSliverBuilder: (BuildContext context, _) {
            return [
              SliverAppBar(
                // floating: true,
                // snap: false,
                pinned: true,
                expandedHeight: 180,
                centerTitle: true,
                title: Text(
                  'My opportunities \& teams',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Column(
                      children: [
                        Container(
                          width: deviceSize.width / 1.2,
                          child: Text(
                            'Lorem ipsum porttitor ultrices mollis velit gravida scelerisque tempor, commodo sodales proin integer praesent et rhoncus litora mattis, curae ligula libero non fringilla rutrum mi. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Michael Jefrrey Jordan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    tabs: [
                      Tab(
                        text: 'Opportunities',
                      ),
                      Tab(
                        text: 'My Teams',
                      ),
                    ],
                  ),
                ),
                floating: true,
                pinned: false,
              ),
            ];
          },
        ),
      ),
    );
  }
}

class ContainerData extends StatelessWidget {
  const ContainerData({
    Key key,
    @required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? deviceSize.height / 3.5
          : deviceSize.height / 2,
      width: deviceSize.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
        color: Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: Image.network(
                    'https://z2r3u4a8.stackpathcdn.com/wp-content/uploads/2015/10/jogos-de-baisebal-no-petco-park-1024x599.jpg',
                    height: 130,
                    width: deviceSize.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Center(
                heightFactor: 2.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(3),
                    ),
                    child: Image.network(
                      'https://logos-download.com/wp-content/uploads/2016/06/IAAF_logo.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text('data'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('data'),
              Text('data'),
            ],
          ),
          Icon(Icons.check)
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
