import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String titulo;
  final String imagem;
  final String banner;

  CustomSliverAppBar({
    this.titulo,
    this.imagem,
    this.banner,
  });

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // expandedHeight: MediaQuery.of(context).size.height /
      //     (MediaQuery.of(context).orientation == Orientation.landscape
      //         ? 2.0
      //         : 3.0),
      floating: false,
      pinned: false,
      snap: false,
      backgroundColor: Colors.white10,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      iconTheme: IconThemeData(
        color: Colors.orange[900],
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30.0),
          bottomRight: const Radius.circular(30.0),
        ),
      ),
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          widget.titulo,
          style: TextStyle(
            color: Colors.orange[900],
            fontSize: 28,
          ),
        ),
        background: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0),
              ),
              child: Image.network(
                widget.imagem,
                // height: 100,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  // maxRadius: 30.0,
                  radius: 40.0,
                  backgroundImage: NetworkImage(widget.banner),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
