import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/historicoJob_model.dart';
import 'package:hellohit/models/premio_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';

class ProfileTimeEdicaoScreen extends StatefulWidget {
  static const routeName = '/profileTimeEdicaoScreen';
  @override
  _ProfileTimeEdicaoScreenState createState() =>
      _ProfileTimeEdicaoScreenState();
}

class _ProfileTimeEdicaoScreenState extends State<ProfileTimeEdicaoScreen> {
  final _formProfileTime = GlobalKey<FormState>();
  bool _carregado = false;
  String idArgs;
  File _photoImage;
  File _coverImage;
  // Uint8List _coverImage2;
  ProfileStore _profileStore;
  ProfileTime _profileAtual;
  final picker = ImagePicker();
  static List<Premio> awardList = [Premio()];
  static List<HistoricoJob> jobHistoryList = [HistoricoJob()];
  static List<Skill> skillList = [Skill()];

  @override
  void didChangeDependencies() {
    idArgs = ModalRoute.of(context).settings.arguments;
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _profileStore.loadTimeProfile(idArgs);
    super.didChangeDependencies();
  }

  Future getPhotoImage() async {
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

  Future getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileStore.imageBanner = File(pickedFile.path);
      _profileStore.imageCover = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }

  void deleteImageCover() {
    _profileStore.imageCover = null;
  }

  Future<void> _saveForm() async {
    _profileAtual.skills
        .replaceRange(0, _profileAtual.skills.length, skillList);
    _profileAtual.awards
        .replaceRange(0, _profileAtual.awards.length, awardList);
    _profileAtual.jobHistory
        .replaceRange(0, _profileAtual.jobHistory.length, jobHistoryList);
    _profileAtual.skills.clear();
    _profileStore
        .saveTimeProfile(_profileAtual)
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

  void limparCampos() {
    awardList.clear();
    jobHistoryList.clear();
    skillList.clear();

    awardList.add(Premio());
    jobHistoryList.add(HistoricoJob());
    skillList.add(Skill());
  }

  @override
  void dispose() {
    limparCampos();
    _carregado = false;
    _profileStore.limparSkills();
    super.dispose();
  }

  void dadosCarregados() {
    if (!_carregado) {
      skillList = _profileStore.usuarioTime.skills.length == 0
          ? [Skill()]
          : _profileStore.usuarioTime.skills;
      jobHistoryList = _profileStore.usuarioTime.jobHistory.length == 0
          ? [HistoricoJob()]
          : _profileStore.usuarioTime.jobHistory;
      awardList = _profileStore.usuarioTime.awards.length == 0
          ? [Premio()]
          : _profileStore.usuarioTime.awards;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_return
      body: Observer(builder: (_) {
        switch (_profileStore.profilesTimeState) {
          case ProfileState.inicial:
          case ProfileState.carregando:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ProfileState.carregado:
            dadosCarregados();
            _carregado = true;
            _profileAtual = _profileStore.usuarioTime;
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
                        key: _formProfileTime,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  _profileAtual.user.avatar.url,
                                                ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${_profileAtual.user.fullName} / ',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blue[600],
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
                                            backgroundImage: _profileStore
                                                        .imageAvatarCover ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    _profileStore.imageBanner),
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
                                            backgroundImage: _profileStore
                                                        .imageAvatar ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    _profileStore.imageBanner),
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
                                          helperText:
                                              'We\'re big on real names araound here, so people know who\'s who',
                                          helperMaxLines: 2,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              32, 16, 32, 16),
                                          labelText: "Team Name",
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
                                          ..text = _profileAtual.user.fullName,
                                        onChanged: (value) =>
                                            _profileAtual.user.fullName = value,
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
                                          labelText: "Location",
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
                                        onChanged: (value) =>
                                            _profileAtual.location = value,
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
                                              "Personal website (optional)",
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
                                        onChanged: (value) => _profileAtual
                                            .personalWebsite = value,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
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
                                          helperMaxLines: 2,
                                          helperText:
                                              'Brief description for your profile. URLs are hyperlinked.',
                                          contentPadding: EdgeInsets.fromLTRB(
                                              32, 16, 32, 16),
                                          labelText: "Bio",
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
                                        onChanged: (value) =>
                                            _profileAtual.bio = value,
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
                                    'Awards',
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
                                ..._getAwards(),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     top: 20.0,
                                //     bottom: 10.0,
                                //   ),
                                //   child: Text(
                                //     'Skills',
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.grey,
                                //       fontSize: 22,
                                //     ),
                                //   ),
                                // ),
                                // Divider(
                                //   color: Colors.grey,
                                // ),
                                // ..._getSkills(),
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
                                ..._getJobHistory(),
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
                                        Observer(
                                          builder: (_) => Checkbox(
                                            value: _profileStore.fulltime,
                                            onChanged: (value) {
                                              _profileStore.fulltime = value;
                                              _profileStore.timefullTime(value);
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
                                              _profileStore
                                                  .timeFreeLance(value);
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
                                    Row(
                                      children: [
                                        Observer(
                                          builder: (_) => Checkbox(
                                            value: _profileStore.beSponsored,
                                            onChanged: (value) {
                                              _profileStore.beSponsored = value;
                                              _profileStore.beSponsor(value);
                                            },
                                          ),
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
      }),
    );
  }

  List<Widget> _getAwards() {
    List<Widget> awardsTextFields = [];
    for (int i = 0; i < awardList.length; i++) {
      awardsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: AwardTextField(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButtonAward(i == awardList.length - 1, i),
          ],
        ),
      ));
    }
    return awardsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButtonAward(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          awardList.insert(0, Premio());
        } else
          awardList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _getJobHistory() {
    List<Widget> jobsTextFields = [];
    for (int i = 0; i < jobHistoryList.length; i++) {
      jobsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: JobHistoryTextField(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButtonJobHistory(i == jobHistoryList.length - 1, i),
          ],
        ),
      ));
    }
    return jobsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButtonJobHistory(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          jobHistoryList.insert(0, HistoricoJob());
        } else
          jobHistoryList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _getSkills() {
    List<Widget> skillsTextFields = [];
    for (int i = 0; i < skillList.length; i++) {
      skillsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: SkillsTextField(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButtonSkills(i == skillList.length - 1, i),
          ],
        ),
      ));
    }
    return skillsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButtonSkills(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          skillList.insert(0, Skill());
        } else
          skillList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

//----------------------------------------//

class AwardTextField extends StatefulWidget {
  final int index;
  AwardTextField(this.index);
  @override
  _AwardTextFieldState createState() => _AwardTextFieldState();
}

class _AwardTextFieldState extends State<AwardTextField> {
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  TextEditingController _monthController;
  TextEditingController _yearsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _monthController = TextEditingController();
    _yearsController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          _ProfileTimeEdicaoScreenState.awardList[widget.index].awardName ?? '';
      _descriptionController.text =
          _ProfileTimeEdicaoScreenState.awardList[widget.index].description ??
              '';
      _monthController.text =
          _ProfileTimeEdicaoScreenState.awardList[widget.index].month ?? '';
      _yearsController.text =
          _ProfileTimeEdicaoScreenState.awardList[widget.index].year == null
              ? ''
              : _ProfileTimeEdicaoScreenState.awardList[widget.index].year
                  .toString();
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            cursorColor: Color(0xFFE0651F),
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              labelText: "Award Name",
              labelStyle: TextStyle(color: Color(0xFFE0651F)),
              hintStyle: TextStyle(color: Color(0xFFE0651F)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            controller: _nameController,
            onChanged: (value) => _ProfileTimeEdicaoScreenState
                .awardList[widget.index].awardName = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextField(
            cursorColor: Color(0xFFE0651F),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              labelText: "Description",
              labelStyle: TextStyle(color: Color(0xFFE0651F)),
              hintStyle: TextStyle(color: Color(0xFFE0651F)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            controller: _descriptionController,
            onChanged: (value) => _ProfileTimeEdicaoScreenState
                .awardList[widget.index].description = value,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    cursorColor: Color(0xFFE0651F),
                    keyboardType: TextInputType.numberWithOptions(
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "Month",
                      labelStyle: TextStyle(color: Color(0xFFE0651F)),
                      hintStyle: TextStyle(color: Color(0xFFE0651F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    controller: _monthController,
                    onChanged: (value) => _ProfileTimeEdicaoScreenState
                        .awardList[widget.index].month = value,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  cursorColor: Color(0xFFE0651F),
                  keyboardType: TextInputType.numberWithOptions(
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
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Year",
                    labelStyle: TextStyle(color: Color(0xFFE0651F)),
                    hintStyle: TextStyle(color: Color(0xFFE0651F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  controller: _yearsController,
                  onChanged: (value) => _ProfileTimeEdicaoScreenState
                      .awardList[widget.index].year = int.parse(value),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//----------------------------------------//

class JobHistoryTextField extends StatefulWidget {
  final int index;
  JobHistoryTextField(this.index);
  @override
  _JobHistoryTextFieldState createState() => _JobHistoryTextFieldState();
}

class _JobHistoryTextFieldState extends State<JobHistoryTextField> {
  TextEditingController _roleController;
  TextEditingController _companyController;
  TextEditingController _toMonthController;
  TextEditingController _toYearsController;
  TextEditingController _fromMonthController;
  TextEditingController _fromYearsController;

  @override
  void initState() {
    super.initState();
    _roleController = TextEditingController();
    _companyController = TextEditingController();
    _toMonthController = TextEditingController();
    _toYearsController = TextEditingController();
    _fromMonthController = TextEditingController();
    _fromYearsController = TextEditingController();
  }

  @override
  void dispose() {
    _roleController.dispose();
    _companyController.dispose();
    _toYearsController.dispose();
    _toMonthController.dispose();
    _fromMonthController.dispose();
    _fromYearsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _roleController.text =
          _ProfileTimeEdicaoScreenState.jobHistoryList[widget.index].role ?? '';
      _companyController.text =
          _ProfileTimeEdicaoScreenState.jobHistoryList[widget.index].company ??
              '';
      _toYearsController.text =
          _ProfileTimeEdicaoScreenState.jobHistoryList[widget.index].toYear ??
              '';
      _toMonthController.text =
          _ProfileTimeEdicaoScreenState.jobHistoryList[widget.index].toMonth ??
              '';
      _fromMonthController.text = _ProfileTimeEdicaoScreenState
              .jobHistoryList[widget.index].fromMonth ??
          '';
      _fromYearsController.text =
          _ProfileTimeEdicaoScreenState.jobHistoryList[widget.index].fromYear ??
              '';
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            cursorColor: Color(0xFFE0651F),
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              labelText: "Role",
              labelStyle: TextStyle(color: Color(0xFFE0651F)),
              hintStyle: TextStyle(color: Color(0xFFE0651F)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            controller: _roleController,
            onChanged: (value) => _ProfileTimeEdicaoScreenState
                .jobHistoryList[widget.index].role = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextField(
            cursorColor: Color(0xFFE0651F),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              labelText: "Company",
              labelStyle: TextStyle(color: Color(0xFFE0651F)),
              hintStyle: TextStyle(color: Color(0xFFE0651F)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            controller: _companyController,
            onChanged: (value) => _ProfileTimeEdicaoScreenState
                .jobHistoryList[widget.index].company = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
          child: Text('TO'),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    cursorColor: Color(0xFFE0651F),
                    keyboardType: TextInputType.numberWithOptions(
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "Month",
                      labelStyle: TextStyle(color: Color(0xFFE0651F)),
                      hintStyle: TextStyle(color: Color(0xFFE0651F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    controller: _fromMonthController,
                    onChanged: (value) => _ProfileTimeEdicaoScreenState
                        .jobHistoryList[widget.index].fromMonth = value,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  cursorColor: Color(0xFFE0651F),
                  keyboardType: TextInputType.numberWithOptions(
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
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Years",
                    labelStyle: TextStyle(color: Color(0xFFE0651F)),
                    hintStyle: TextStyle(color: Color(0xFFE0651F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  controller: _fromYearsController,
                  onChanged: (value) => _ProfileTimeEdicaoScreenState
                      .jobHistoryList[widget.index].fromYear = value,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
          child: Text('From'),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    cursorColor: Color(0xFFE0651F),
                    keyboardType: TextInputType.numberWithOptions(
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFE0651F),
                          width: 1.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "Month",
                      labelStyle: TextStyle(color: Color(0xFFE0651F)),
                      hintStyle: TextStyle(color: Color(0xFFE0651F)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    controller: _toMonthController,
                    onChanged: (value) => _ProfileTimeEdicaoScreenState
                        .jobHistoryList[widget.index].toMonth = value,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  cursorColor: Color(0xFFE0651F),
                  keyboardType: TextInputType.numberWithOptions(
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
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Years",
                    labelStyle: TextStyle(color: Color(0xFFE0651F)),
                    hintStyle: TextStyle(color: Color(0xFFE0651F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  controller: _toYearsController,
                  onChanged: (value) => _ProfileTimeEdicaoScreenState
                      .jobHistoryList[widget.index].toYear = value,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// --------------- //

class SkillsTextField extends StatefulWidget {
  final int index;
  SkillsTextField(this.index);
  @override
  _SkillsTextFieldState createState() => _SkillsTextFieldState();
}

class _SkillsTextFieldState extends State<SkillsTextField> {
  TextEditingController _skillController;
  TextEditingController _yearsController;

  @override
  void initState() {
    super.initState();
    _skillController = TextEditingController();
    _yearsController = TextEditingController();
  }

  @override
  void dispose() {
    _yearsController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _yearsController.text =
          _ProfileTimeEdicaoScreenState.skillList[widget.index].description ??
              '';
      _skillController.text =
          _ProfileTimeEdicaoScreenState.skillList[widget.index].title ?? '';
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            cursorColor: Color(0xFFE0651F),
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Color(0xFFE0651F),
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              labelText: "Skill",
              labelStyle: TextStyle(color: Color(0xFFE0651F)),
              hintStyle: TextStyle(color: Color(0xFFE0651F)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            controller: _skillController,
            onChanged: (value) => _ProfileTimeEdicaoScreenState
                .skillList[widget.index].title = value,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  cursorColor: Color(0xFFE0651F),
                  keyboardType: TextInputType.numberWithOptions(
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
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: "Years",
                    labelStyle: TextStyle(color: Color(0xFFE0651F)),
                    hintStyle: TextStyle(color: Color(0xFFE0651F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  controller: _yearsController,
                  onChanged: (value) => _ProfileTimeEdicaoScreenState
                      .skillList[widget.index].description = value,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
