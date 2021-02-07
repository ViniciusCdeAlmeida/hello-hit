import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:hellohit/screens/time/tela_explicacao_time_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileTimeEdicaoScreen extends StatefulWidget {
  static const routeName = '/profileTimeEdicaoScreen';
  @override
  _ProfileTimeEdicaoScreenState createState() =>
      _ProfileTimeEdicaoScreenState();
}

class _ProfileTimeEdicaoScreenState extends State<ProfileTimeEdicaoScreen> {
  final _formProfileTime = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  final _siteFocusNode = FocusNode();
  final _bioFocusNode = FocusNode();

  bool _checkboxWorkValue = false;
  File _photoImage;
  File _coverImage;
  Uint8List _coverImage2;
  final picker = ImagePicker();

  AutenticacaoStore _autenticacaoStore;
  Usuario _usuario;

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _usuario = _autenticacaoStore.autenticacao;
    super.didChangeDependencies();
  }

  Future getPhotoImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photoImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _coverImage2 = File(pickedFile.path).readAsBytesSync();
      } else {
        print('No image selected.');
      }
    });
  }

  void deleteImage() {
    setState(() {
      _coverImage = null;
    });
  }

  var _perfilTime = Profile(
    bio: '',
    jobHistory: [],
    location: '',
    personalWebsite: '',
    skills: [],
    workAvailability: '',
    avatar: null,
    banner: null,
  );

  Future<void> _saveForm() async {
    final isValid = _formProfileTime.currentState.validate();
    if (!isValid) {
      return;
    }
    _formProfileTime.currentState.save();
    // print(_cadastroUsuario);
    // _cadastroStore.cadastroUsuario(_cadastroUsuario).catchError(
    //   (onError) {
    //     showDialog<Null>(
    //       context: context,
    //       builder: (ctx) => AlertDialog(
    //         title: Text('Error'),
    //         content: Text(onError),
    //         actions: <Widget>[
    //           FlatButton(
    //             onPressed: () {
    //               Navigator.of(ctx).pop();
    //             },
    //             child: Text('OK'),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // ).then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            centerTitle: true,
            title: Text('Edit your Profile'),
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Observer(
                  builder: (_) {
                    return Form(
                      key: _formProfileTime,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(
                                            TelaExplicacaoProItem.routeName),
                                    child: Container(
                                      width: 300,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(1),
                                        ),
                                        border: Border.all(
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Go ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Team Premium',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFE0651F),
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Add team members to your team, let them do your job to push your brand foward, beginning with 3 members for just \12.90.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20.0,
                                        child: _usuario.avatar == null
                                            ? Image.asset(
                                                'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                            : Image.network(
                                                _usuario.avatarImg,
                                              ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${_usuario.full_name} / ',
                                                      style: TextStyle(
                                                        color: Colors.blue[600],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Edit Profile',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            image: _coverImage2 == null
                                                ? null
                                                : DecorationImage(
                                                    image: MemoryImage(
                                                        _coverImage2),
                                                  ),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FlatButton(
                                                  color: Color(0xFFE0651F),
                                                  onPressed: getCoverImage,
                                                  child: Text(
                                                    'Upload new Cover',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0),
                                                  child: FlatButton(
                                                    color: Colors.grey,
                                                    onPressed: deleteImage,
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 45.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: _photoImage == null
                                              ? null
                                              : FileImage(_photoImage),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FlatButton(
                                                  color: Color(0xFFE0651F),
                                                  onPressed: getPhotoImage,
                                                  child: Text(
                                                    'Upload new picture',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0),
                                                  child: FlatButton(
                                                    color: Colors.grey,
                                                    onPressed: deleteImage,
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        helperText:
                                            'We\'re big on real names araound here, so people know who\'s who',
                                        helperMaxLines: 2,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Team Name",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Location",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText:
                                            "Personal website (optional)",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        helperText:
                                            'Brief description for your profile. URLs are hyperlinked.',
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Bio",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text(
                                      'Add awards that your team has won or participated in',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Award Name",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Description",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          width: 140,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: TextFormField(
                                              cursorColor: Color(0xFFE0651F),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                signed: false,
                                                decimal: false,
                                              ),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                              maxLength: 2,
                                              maxLengthEnforced: true,
                                              decoration: InputDecoration(
                                                counterText: '',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0651F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0651F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        32, 16, 32, 16),
                                                labelText: "Month",
                                                labelStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                hintStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 140,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: TextFormField(
                                            cursorColor: Color(0xFFE0651F),
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              signed: false,
                                              decimal: false,
                                            ),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                            maxLength: 4,
                                            maxLengthEnforced: true,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0651F),
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0651F),
                                                  width: 1.0,
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      32, 16, 32, 16),
                                              labelText: "Years",
                                              labelStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Skills",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        helperText:
                                            'Add up to 16 skills to display on your profile. Use a comma to separate skills.',
                                        helperMaxLines: 2,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'Background',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'Job History',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Role",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormField(
                                      cursorColor: Color(0xFFE0651F),
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0651F),
                                            width: 1.0,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(32, 16, 32, 16),
                                        labelText: "Company",
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          width: 140,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: TextFormField(
                                              cursorColor: Color(0xFFE0651F),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                signed: false,
                                                decimal: false,
                                              ),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                              maxLength: 2,
                                              maxLengthEnforced: true,
                                              decoration: InputDecoration(
                                                counterText: '',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0651F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0651F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        32, 16, 32, 16),
                                                labelText: "Month",
                                                labelStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                hintStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 140,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: TextFormField(
                                            cursorColor: Color(0xFFE0651F),
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              signed: false,
                                              decimal: false,
                                            ),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                            maxLength: 4,
                                            maxLengthEnforced: true,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0651F),
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0651F),
                                                  width: 1.0,
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      32, 16, 32, 16),
                                              labelText: "Years",
                                              labelStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'Work Availability',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Center(
                                child: Container(
                                  // width: 100,
                                  // height: 100,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Get your profle ready by setting your work preferences.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'When you become a player (either by receiving an invitation or by ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'going Pro',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.blue[600],
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ') any one will be able to message you about work opportunities.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 15.0,
                                    ),
                                    child: Text(
                                      'Are you available for work?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxWorkValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _checkboxWorkValue = newValue;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Full time',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxWorkValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _checkboxWorkValue = newValue;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Freelance / Contract',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxWorkValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _checkboxWorkValue = newValue;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Be sponsored',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Center(
                                  child: FlatButton(
                                    minWidth: 250,
                                    color: Color(0xFFE0651F),
                                    onPressed: () {},
                                    child: Text(
                                      'Save Profile',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
