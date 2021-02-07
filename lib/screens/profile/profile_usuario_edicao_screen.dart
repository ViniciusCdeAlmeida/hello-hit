import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/educacao_model.dart';
import 'package:hellohit/models/historicoJob_model.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/edicao_profile_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:provider/provider.dart';

class ProfileUsuarioEdicaoScreen extends StatefulWidget {
  static const routeName = '/profileUsuarioEdicaoScreen';
  @override
  _ProfileUsuarioEdicaoScreenState createState() =>
      _ProfileUsuarioEdicaoScreenState();
}

class _ProfileUsuarioEdicaoScreenState
    extends State<ProfileUsuarioEdicaoScreen> {
  final _formProfileUsuario = GlobalKey<FormState>();
  String idArgs;
  final _skillFieldController = TextEditingController();
  // final _nameFocusNode = FocusNode();
  // final _locationFocusNode = FocusNode();
  // final _siteFocusNode = FocusNode();
  // final _bioFocusNode = FocusNode();
  bool freelance = false;
  bool fullTime = false;

  final picker = ImagePicker();

  // var _dadosEdicao = Profile(
  //   avatar: '',
  //   bio: '',
  //   location: '',
  //   personalWebsite: '',
  //   skills: [],
  //   jobHistory: [],
  //   educations: [],
  // );

  ProfileStore _profileStore;
  Profile _profileAtual;

  @override
  void didChangeDependencies() {
    idArgs = ModalRoute.of(context).settings.arguments;
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _profileStore.loadUsuarioProfile(idArgs);
    _profileAtual = _profileStore.usuario;
    super.didChangeDependencies();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileStore.image = File(pickedFile.path);
      _profileStore.imageAvatar = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }

  void deleteImage() {
    _profileStore.imageAvatar = null;
  }

  var _educacaoUsuario = Educacao(
    degree: '',
    graduationYear: null,
    schoolName: '',
  );

  Future<void> _saveForm() async {
    _profileAtual.educations.add(_educacaoUsuario);
    _profileAtual.skills = _profileStore.skills.toList();
    _profileStore
        .saveUsuarioProfile(_profileAtual, _profileStore.imageAvatar)
        .then((_) => Navigator.of(context).pop())
        .catchError(
      (onError) {
        showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text(onError),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('OK'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_profileStore.profilesState) {
            case ProfileState.inicial:
            case ProfileState.carregando:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ProfileState.carregado:
              _profileAtual = _profileStore.usuario;
              return CustomScrollView(
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
                      onPressed: () {
                        _profileStore.freelance = false;
                        _profileStore.fulltime = false;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Form(
                          key: _formProfileUsuario,
                          child: Center(
                            child: Container(
                              width: 350,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30.0),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed(TelaExplicacaoProItem
                                                .routeName),
                                        child: Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                      text: 'Pro',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFFE0651F),
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                'Add power features for just \$5/month',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            child: _profileAtual.user.avatar ==
                                                    null
                                                ? Image.asset(
                                                    'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                                : Image.network(
                                                    _profileAtual
                                                        .user.avatar.url,
                                                  ),
                                          ),
                                          Container(
                                            width: 200,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '${_profileAtual.user.full_name} / ',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .blue[600],
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4.0),
                                                    child: Text(
                                                      'Set up your Dribble presence and hiring needs',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey,
                                                        fontSize: 15,
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 45.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage:
                                                  _profileStore.imageAvatar ==
                                                          null
                                                      ? null
                                                      : FileImage(
                                                          _profileStore.image),
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
                                                      onPressed: getImage,
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
                                        child: TextField(
                                          cursorColor: Color(0xFFE0651F),
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          controller: TextEditingController()
                                            ..text =
                                                _profileAtual.user.full_name,
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Name',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            // _dadosEdicao.name = value;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: TextField(
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Location',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text = _profileAtual.location,
                                          onChanged: (value) {
                                            _profileAtual.location = value;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: TextField(
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText:
                                                'Personal website (optional)',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text =
                                                _profileAtual.personalWebsite,
                                          onChanged: (value) {
                                            _profileAtual.personalWebsite =
                                                value;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: TextField(
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Bio',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text = _profileAtual.bio,
                                          onChanged: (value) {
                                            _profileAtual.bio = value;
                                          },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 10.0,
                                        ),
                                        child: Text(
                                          'Select your top 3 specialities and add years of experience',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: TextField(
                                          controller: _skillFieldController,
                                          cursorColor: Color(0xFFE0651F),
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          onSubmitted: (_) {
                                            _profileStore.skills.add(
                                              Skill(
                                                  description:
                                                      _skillFieldController
                                                          .text,
                                                  title: _skillFieldController
                                                      .text),
                                            );
                                            _skillFieldController.clear();
                                          },
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Skills',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            helperText:
                                                'Add up to 16 skills to display on your profile.',
                                            helperMaxLines: 2,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                        child: Text(
                                          'Skills',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Observer(
                                            builder: (_) => ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  _profileStore.skills.length,
                                              shrinkWrap: true,
                                              itemBuilder: (_, idx) => Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: Container(
                                                  height: 30,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(4),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(_profileStore
                                                          .skills[idx].title),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      // Column(
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(bottom: 10),
                                      //       child: Container(
                                      //         height: 30,
                                      //         padding: const EdgeInsets.only(left: 5.0),
                                      //         decoration: BoxDecoration(
                                      //           color: Colors.grey[300],
                                      //           borderRadius: const BorderRadius.all(
                                      //             Radius.circular(4),
                                      //           ),
                                      //         ),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      // Checkbox(
                                      //   value: checkboxValue,
                                      //   onChanged: (newValue) {
                                      //     setState(() {
                                      //       checkboxValue = newValue;
                                      //     });
                                      //   },
                                      // ),
                                      //             Text(_skills[0]['skill0']),
                                      //             SizedBox(
                                      //               width: 50,
                                      //               child: TextField(
                                      //                 maxLength: 2,
                                      //                 maxLengthEnforced: true,
                                      //                 decoration: InputDecoration(
                                      //                   hintText: 'Years',
                                      //                   counterText: '',
                                      //                   contentPadding:
                                      //                       const EdgeInsets.only(
                                      //                     top: 10,
                                      //                     left: 5,
                                      //                     bottom: 10,
                                      //                   ),
                                      //                   enabledBorder: InputBorder.none,
                                      //                   border: InputBorder.none,
                                      //                   focusedErrorBorder:
                                      //                       InputBorder.none,
                                      //                 ),
                                      //                 controller: null,
                                      //                 onEditingComplete: () {},
                                      //                 onChanged: null,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Column(
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(bottom: 10),
                                      //       child: Container(
                                      //         height: 30,
                                      //         padding: const EdgeInsets.only(left: 5.0),
                                      //         decoration: BoxDecoration(
                                      //           color: Colors.grey[300],
                                      //           borderRadius: const BorderRadius.all(
                                      //             Radius.circular(4),
                                      //           ),
                                      //         ),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             // Checkbox(
                                      //             //   value: checkboxValue,
                                      //             //   onChanged: (newValue) {
                                      //             //     setState(() {
                                      //             //       checkboxValue = newValue;
                                      //             //     });
                                      //             //   },
                                      //             // ),
                                      //             Text(_skills[1]['skill1']),
                                      //             SizedBox(
                                      //               width: 50,
                                      //               child: TextField(
                                      //                 maxLength: 2,
                                      //                 maxLengthEnforced: true,
                                      //                 decoration: InputDecoration(
                                      //                   hintText: 'Years',
                                      //                   counterText: '',
                                      //                   contentPadding:
                                      //                       const EdgeInsets.only(
                                      //                     top: 10,
                                      //                     left: 5,
                                      //                     bottom: 10,
                                      //                   ),
                                      //                   enabledBorder: InputBorder.none,
                                      //                   border: InputBorder.none,
                                      //                   focusedErrorBorder:
                                      //                       InputBorder.none,
                                      //                 ),
                                      //                 controller: null,
                                      //                 onEditingComplete: () {},
                                      //                 onChanged: null,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      //   Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                      //     children: [
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(bottom: 10),
                                      //         child: Container(
                                      //           height: 30,
                                      //           padding: const EdgeInsets.only(left: 5.0),
                                      //           decoration: BoxDecoration(
                                      //             color: Colors.grey[300],
                                      //             borderRadius: const BorderRadius.all(
                                      //               Radius.circular(4),
                                      //             ),
                                      //           ),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.spaceBetween,
                                      //             children: [
                                      //               // Checkbox(
                                      //               //   value: checkboxValue,
                                      //               //   onChanged: (newValue) {
                                      //               //     setState(() {
                                      //               //       checkboxValue = newValue;
                                      //               //     });
                                      //               //   },
                                      //               // ),
                                      //               Text(_skills[2]['skill2']),
                                      //               SizedBox(
                                      //                 width: 50,
                                      //                 child: TextField(
                                      //                   maxLength: 2,
                                      //                   maxLengthEnforced: true,
                                      //                   decoration: InputDecoration(
                                      //                     hintText: 'Years',
                                      //                     counterText: '',
                                      //                     contentPadding:
                                      //                         const EdgeInsets.only(
                                      //                       top: 10,
                                      //                       left: 5,
                                      //                       bottom: 10,
                                      //                     ),
                                      //                     enabledBorder: InputBorder.none,
                                      //                     border: InputBorder.none,
                                      //                     focusedErrorBorder:
                                      //                         InputBorder.none,
                                      //                   ),
                                      //                   controller: null,
                                      //                   onEditingComplete: () {},
                                      //                   onChanged: null,
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   )
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
                                        child: TextField(
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Role',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text = _profileAtual
                                                    .jobHistory.isNotEmpty
                                                ? _profileAtual
                                                    .jobHistory[0].role
                                                : '',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: TextField(
                                          cursorColor: Color(0xFFE0651F),
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Company',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text = _profileAtual
                                                    .jobHistory.isNotEmpty
                                                ? _profileAtual
                                                    .jobHistory[0].company
                                                : '',
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(
                                      //           right: 8.0),
                                      //       child: SizedBox(
                                      //         width: 140,
                                      //         child: Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               bottom: 10.0),
                                      //           child: TextField(
                                      //             cursorColor:
                                      //                 Color(0xFFE0651F),
                                      //             keyboardType: TextInputType
                                      //                 .numberWithOptions(
                                      //               signed: false,
                                      //               decimal: false,
                                      //             ),
                                      //             style: TextStyle(
                                      //               fontSize: 15,
                                      //             ),
                                      //             maxLength: 2,
                                      //             maxLengthEnforced: true,
                                      //             decoration: InputDecoration(
                                      //               counterText: '',
                                      //               enabledBorder:
                                      //                   OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         25.0),
                                      //                 borderSide: BorderSide(
                                      //                   color:
                                      //                       Color(0xFFE0651F),
                                      //                   width: 1.0,
                                      //                 ),
                                      //               ),
                                      //               focusedBorder:
                                      //                   OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         25.0),
                                      //                 borderSide: BorderSide(
                                      //                   color:
                                      //                       Color(0xFFE0651F),
                                      //                   width: 1.0,
                                      //                 ),
                                      //               ),
                                      //               contentPadding:
                                      //                   EdgeInsets.fromLTRB(
                                      //                       32, 16, 32, 16),
                                      //               labelText: 'Month',
                                      //               labelStyle: TextStyle(
                                      //                   color:
                                      //                       Color(0xFFE0651F)),
                                      //               hintStyle: TextStyle(
                                      //                   color:
                                      //                       Color(0xFFE0651F)),
                                      //               border: OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         32),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 140,
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             bottom: 10.0),
                                      //         child: TextField(
                                      //           cursorColor: Color(0xFFE0651F),
                                      //           keyboardType: TextInputType
                                      //               .numberWithOptions(
                                      //             signed: false,
                                      //             decimal: false,
                                      //           ),
                                      //           style: TextStyle(
                                      //             fontSize: 15,
                                      //           ),
                                      //           maxLength: 4,
                                      //           maxLengthEnforced: true,
                                      //           decoration: InputDecoration(
                                      //             counterText: '',
                                      //             enabledBorder:
                                      //                 OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       25.0),
                                      //               borderSide: BorderSide(
                                      //                 color: Color(0xFFE0651F),
                                      //                 width: 1.0,
                                      //               ),
                                      //             ),
                                      //             focusedBorder:
                                      //                 OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       25.0),
                                      //               borderSide: BorderSide(
                                      //                 color: Color(0xFFE0651F),
                                      //                 width: 1.0,
                                      //               ),
                                      //             ),
                                      //             contentPadding:
                                      //                 EdgeInsets.fromLTRB(
                                      //                     32, 16, 32, 16),
                                      //             labelText: 'Years',
                                      //             labelStyle: TextStyle(
                                      //                 color: Color(0xFFE0651F)),
                                      //             hintStyle: TextStyle(
                                      //                 color: Color(0xFFE0651F)),
                                      //             border: OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       32),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text(
                                      'Educational (optional)',
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
                                        child: TextField(
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
                                            contentPadding: EdgeInsets.fromLTRB(
                                                32, 16, 32, 16),
                                            labelText: 'Degree',
                                            labelStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            hintStyle: TextStyle(
                                                color: Color(0xFFE0651F)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                          ),
                                          controller: TextEditingController()
                                            ..text = _profileAtual
                                                    .educations.isNotEmpty
                                                ? _profileAtual
                                                    .educations[0].degree
                                                : '',
                                          onChanged: (value) {
                                            _educacaoUsuario.degree = value;
                                          },
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: SizedBox(
                                              width: 200,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10.0),
                                                child: TextField(
                                                  cursorColor:
                                                      Color(0xFFE0651F),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  decoration: InputDecoration(
                                                    counterText: '',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE0651F),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE0651F),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            32, 16, 32, 16),
                                                    labelText:
                                                        'School/University',
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xFFE0651F)),
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xFFE0651F)),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32),
                                                    ),
                                                  ),
                                                  controller:
                                                      TextEditingController()
                                                        ..text = _profileAtual
                                                                .educations
                                                                .isNotEmpty
                                                            ? _profileAtual
                                                                .educations[0]
                                                                .schoolName
                                                            : '',
                                                  onChanged: (value) {
                                                    _educacaoUsuario
                                                        .schoolName = value;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 134,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: TextField(
                                                cursorColor: Color(0xFFE0651F),
                                                keyboardType: TextInputType
                                                    .numberWithOptions(
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
                                                  labelText: 'Year',
                                                  labelStyle: TextStyle(
                                                      color: Color(0xFFE0651F)),
                                                  hintStyle: TextStyle(
                                                      color: Color(0xFFE0651F)),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32),
                                                  ),
                                                ),
                                                controller:
                                                    TextEditingController()
                                                      ..text = _profileAtual
                                                              .educations
                                                              .isNotEmpty
                                                          ? _profileAtual
                                                              .educations[0]
                                                              .graduationYear
                                                              .toString()
                                                          : '',
                                                onChanged: (value) {
                                                  _educacaoUsuario
                                                          .graduationYear =
                                                      int.parse(value);
                                                },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Observer(
                                            builder: (_) => Checkbox(
                                              value: _profileStore.fulltime,
                                              onChanged: (value) {
                                                _profileStore.fulltime = value;
                                                _profileStore.fullTime(value);
                                              },
                                            ),
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
                                          Observer(
                                            builder: (_) => Checkbox(
                                              value: _profileStore.freelance,
                                              onChanged: (value) {
                                                _profileStore.freelance = value;
                                                _profileStore.freeLance(value);
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Freelance / Contract',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Center(
                                      child: FlatButton(
                                        minWidth: 250,
                                        color: Color(0xFFE0651F),
                                        onPressed: _saveForm,
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
                        ),
                      ],
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
