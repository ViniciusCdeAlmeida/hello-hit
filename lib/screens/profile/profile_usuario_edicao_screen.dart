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

  final _skillFieldController = TextEditingController();
  // final _nameFocusNode = FocusNode();
  // final _locationFocusNode = FocusNode();
  // final _siteFocusNode = FocusNode();
  // final _bioFocusNode = FocusNode();
  bool freelance = false;
  bool fullTime = false;

  File _image;
  final picker = ImagePicker();

  var _dadosEdicao = Profile(
    avatar: '',
    bio: '',
    location: '',
    personalWebsite: '',
    skills: [],
    jobHistory: [],
    educations: [],
  );

  // List _skills = [
  //   {
  //     'skill0': '',
  //     'years': '',
  //   },
  //   {
  //     'skill1': '',
  //     'years': '',
  //   },
  //   {
  //     'skill2': '',
  //     'years': '',
  //   },
  // ];

  ProfileStore _profileStore;
  Usuario _usuario;
  Profile _profileAtual;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context).settings.arguments;
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _profileStore.loadUsuarioProfile(id);
    _profileAtual = _profileStore.usuario;
    super.didChangeDependencies();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _dadosUsuario.avatar.url = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  var _historicoJobUsuario = HistoricoJob();

  var _educacaoUsuario = Educacao(
    degree: '',
    graduationYear: '',
    schoolName: '',
  );

  var _dadosUsuario = Usuario();

  Future<void> _saveForm() async {
    final isValid = _formProfileUsuario.currentState.validate();
    if (!isValid) {
      return;
    }
    _formProfileUsuario.currentState.save();
    _dadosEdicao.educations.add(_educacaoUsuario);
    _dadosUsuario.id = _usuario.id;

    _profileStore.saveUsuarioProfile(_dadosEdicao).catchError(
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
    ).then((_) => Navigator.of(context).pop());
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
    _profileStore = Provider.of<ProfileStore>(context);
    // ignore: missing_return
    return Scaffold(body: Observer(builder: (_) {
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Form(
                      key: _formProfileUsuario,
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
                                      height: 50,
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
                                                  text: 'Pro',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20.0,
                                        child: _profileAtual.user.avatar == null
                                            ? Image.asset(
                                                'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                            : Image.network(
                                                _usuario.avatar.url,
                                              ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                child: Text(
                                                  'Set up your Dribble presence and hiring needs',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                          backgroundImage: _image == null
                                              ? null
                                              : FileImage(_image),
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
                                        labelText: 'Name',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        // _dadosEdicao.name = value;
                                      },
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
                                        labelText: 'Location',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _dadosEdicao.location = value;
                                      },
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
                                            'Personal website (optional)',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _dadosEdicao.personalWebsite = value;
                                      },
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
                                        labelText: 'Bio',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _dadosEdicao.bio = value;
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: TextFormField(
                                      controller: _skillFieldController,
                                      cursorColor: Color(0xFFE0651F),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      onFieldSubmitted: (_) {
                                        _dadosEdicao.skills.add(
                                          Skill(
                                              description:
                                                  _skillFieldController.text,
                                              title:
                                                  _skillFieldController.text),
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
                                        // suffixIcon: IconButton(
                                        //   icon: Icon(Icons.add),
                                        //   onPressed: () {
                                        // for (var i = 0;
                                        //     i < _skills.length;
                                        //     i++) {
                                        //   if (_skills[i]['skill$i'] == '') {
                                        //     _skills[i]['skill$i'] =
                                        //         _skillFieldController.text;
                                        //     _skillFieldController.clear();
                                        //   }
                                        // }
                                        //     _skills.add(
                                        //       Skill(
                                        //           description:
                                        //               _skillFieldController.text,
                                        //           title:
                                        //               _skillFieldController.text),
                                        //     );
                                        //     _skillFieldController.clear();
                                        //   },
                                        // ),
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
                                        labelText: 'Skills',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
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
                                          itemCount: _dadosEdicao.skills.length,
                                          shrinkWrap: true,
                                          itemBuilder: (_, idx) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              height: 30,
                                              padding: const EdgeInsets.only(
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
                                                  // Checkbox(
                                                  //   value: checkboxValue,
                                                  //   onChanged: (newValue) {
                                                  //     setState(() {
                                                  //       checkboxValue = newValue;
                                                  //     });
                                                  //   },
                                                  // ),
                                                  Text(_dadosEdicao
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
                                  //               child: TextFormField(
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
                                  //               child: TextFormField(
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
                                  //                 child: TextFormField(
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
                                        labelText: 'Role',
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
                                        labelText: 'Company',
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
                                                labelText: 'Month',
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
                                              labelText: 'Years',
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
                                        labelText: 'Degree',
                                        labelStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        hintStyle:
                                            TextStyle(color: Color(0xFFE0651F)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _educacaoUsuario.degree = value;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.83,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: TextFormField(
                                              cursorColor: Color(0xFFE0651F),
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
                                                labelText: 'School/University',
                                                labelStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                hintStyle: TextStyle(
                                                    color: Color(0xFFE0651F)),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                              onSaved: (value) {
                                                _educacaoUsuario.schoolName =
                                                    value;
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
                                              labelText: 'Year',
                                              labelStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFE0651F)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                            ),
                                            onSaved: (value) {
                                              _educacaoUsuario.graduationYear =
                                                  value;
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
                                        value: fullTime,
                                        onChanged: (value) {
                                          setState(() {
                                            fullTime = value;
                                            _dadosEdicao.fullTime = value;
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
                                        value: freelance,
                                        onChanged: (value) {
                                          setState(() {
                                            freelance = value;
                                            _dadosEdicao.freelance = value;
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
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
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
    }));
  }
}
