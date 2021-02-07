import 'package:flutter/material.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/screens/profile/widget/profile_skill_item.dart';
import 'package:hellohit/widgets/lista_icones.dart';

class ProfileUsuarioItem extends StatefulWidget {
  final Profile usuario;

  ProfileUsuarioItem(this.usuario);

  @override
  _ProfileUsuarioItemState createState() => _ProfileUsuarioItemState();
}

class _ProfileUsuarioItemState extends State<ProfileUsuarioItem>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceSize = MediaQuery.of(context);
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 60.0,
                  minRadius: 10.0,
                  backgroundImage: NetworkImage(widget.usuario.avatar),
                ),
              ),
            ),
            Positioned.fill(
              right: deviceSize.orientation == Orientation.portrait
                  ? deviceSize.size.width / 3.2
                  : deviceSize.size.width / 2.6,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 18,
                  width: 37,
                  decoration: BoxDecoration(
                    color: Colors.orange[900],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 9.0,
                        color: Colors.white,
                      ),
                      Text(
                        'PRO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Text(widget.usuario.user.full_name),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconRow(
              texto: widget.usuario.hits.toString(),
              icon: Icons.star,
              width: 60,
              height: 60,
              titulo: 'Hits',
            ),
            IconRow(
              icon: Icons.question_answer,
              width: 38,
              height: 38,
              titulo: 'Inbox',
            ),
            IconRow(
              icon: Icons.emoji_events,
              width: 38,
              height: 38,
              titulo: 'Ranking',
            ),
            IconRow(
              icon: Icons.person_add_alt_1,
              width: 38,
              height: 38,
              titulo: 'Be Fan',
            ),
            IconRow(
              // texto: widget.usuario.fans.toString(),
              texto: '',
              icon: Icons.flag,
              width: 60,
              height: 60,
              titulo: 'Fans',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FlatButton(
            color: Colors.orange[700],
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(widget.usuario.user.full_name),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('TEAM MEMBER OF'),
            ],
          ),
        ),
        GridView.custom(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            childAspectRatio: (3.3 / 2),
            mainAxisSpacing: 10,
          ),
          childrenDelegate: SliverChildListDelegate(null
              // widget.usuario.usuarios
              //     .map((usuario) => UsuarioParente(imagem: usuario.imagem))
              //     .toList(),
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('SKILLS'),
            ],
          ),
        ),
        GridView.custom(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 30,
            childAspectRatio: (5 / 2),
            mainAxisSpacing: 10,
          ),
          childrenDelegate: SliverChildListDelegate(
            widget.usuario.skills
                .map((skill) => UsuarioSkills(skill: skill.description))
                .toList(),
          ),
        ),
        Divider(),
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.apps),
            ),
            Tab(
              icon: const Icon(Icons.format_list_bulleted),
            ),
            Tab(
              icon: const Icon(Icons.place),
            ),
            Tab(
              icon: const Icon(Icons.person_pin_circle_outlined),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              GridView.custom(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: (3.3 / 2),
                  mainAxisSpacing: 10,
                ),
                childrenDelegate: SliverChildListDelegate(null
                    // widget.usuario.usuarios
                    //     .map((usuario) => UsuarioParente(imagem: usuario.imagem))
                    //     .toList(),
                    ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search for address...'),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search for address...'),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
