import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:google_place/google_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/stores/index_stores.dart';

class OportunidadeCriacaoScreen extends StatefulWidget {
  static const routeName = '/oportunidadeCriacaoScreen';
  @override
  _OportunidadeCriacaoScreenState createState() => _OportunidadeCriacaoScreenState();
}

class _OportunidadeCriacaoScreenState extends State<OportunidadeCriacaoScreen> {
  // void autoCompleteSearch(String value) async {
  //   var result = await googlePlace.autocomplete.get(value);
  //   if (result != null && result.predictions != null && mounted) {
  //     setState(() {
  //       predictions = result.predictions;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   // apiKey = DotEnv.env['API_KEY'];
  //   // googlePlace = GooglePlace(apiKey);
  //   super.initState();
  // }
  final _formMakeOportunidade = GlobalKey<FormState>();
  QuillController _controller = QuillController.basic();
  int _radioValue = 0;
  int _cor = 0;
  String apiKey;
  String description;
  String location;
  String typeOpportunity;
  int typeSelected;
  String role;
  DateTime expiredAt;

  Oportunidade oportunidade;

  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  List<DropdownMenuItem<int>> talent = [
    DropdownMenuItem<int>(
      value: 1,
      child: Text('Football'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 2,
      child: Text('Basketball'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 3,
      child: Text('Volley'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 4,
      child: Text('Others'),
      onTap: () {},
    ),
  ];

  File _image;
  final picker = ImagePicker();

  DateTime selectedDate = DateTime.now();
  AutenticacaoStore _autenticacaoStore;
  OportunidadeStore _oportunidadeStore;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void makeOportunidade() {
    if (!_formMakeOportunidade.currentState.validate()) {
      return;
    }
    _formMakeOportunidade.currentState.save();
    description = _controller.plainTextEditingValue.text;
    if (_radioValue == 1) oportunidade.location = 'Remote';
    if (_radioValue == 2) oportunidade.location = 'Onsite or Remote';

    if (_cor == 1) oportunidade.typeOpportunity = 'Full-time';
    if (_cor == 2) oportunidade.typeOpportunity = 'Part-time';
    if (_cor == 3) oportunidade.typeOpportunity = 'Freelance';
    if (_cor == 4) oportunidade.typeOpportunity = 'Contract';
    expiredAt = selectedDate;
    oportunidade.description = description;
    // print(oportunidade);

    // var oportunidade = Oportunidade(title: )
    // _oportunidadeStore.makeOportunidade(oportunidade);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        oportunidade.expireAt = picked;
        selectedDate = picked;
      });
  }

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    _oportunidadeStore = Provider.of<OportunidadeStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formMakeOportunidade,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE YOUR POST',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          'Team: ${_autenticacaoStore.usuarioLogado.fullName}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Job title *',
                          ),
                          onSaved: (value) {
                            oportunidade.title = value;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Expired date: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Expired date'),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Job description * ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                QuillToolbar.basic(
                  controller: _controller,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 0.5,
                    ),
                    color: Colors.grey[300],
                  ),
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Text(
                    'Job Location *',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioValue = value;
                                      });
                                    }),
                                Text('Onsite'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 28.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                              top: 8.0,
                                              left: 8.0,
                                            ),
                                            child: Text('Location'),
                                          ),
                                          width: MediaQuery.of(context).size.width / 1.5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 0.1),
                                          child: Container(
                                            height: 30,
                                            width: MediaQuery.of(context).size.width / 1.5,
                                            padding: const EdgeInsets.only(left: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                            ),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'e.g City, State, or Country',
                                                contentPadding: const EdgeInsets.only(
                                                  top: 5,
                                                  left: 5,
                                                  bottom: 10,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                focusedErrorBorder: InputBorder.none,
                                              ),
                                              controller: null,
                                              onEditingComplete: () {},
                                              onSaved: (value) {
                                                oportunidade.location = value;
                                                // if (value.isNotEmpty) {
                                                //   autoCompleteSearch(value);
                                                // } else {
                                                //   if (predictions.length > 0 &&
                                                //       mounted) {
                                                //     setState(() {
                                                //       predictions = [];
                                                //     });
                                                //   }
                                                // }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      border: Border.all(
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value;
                                    });
                                  }),
                              Text('Remote'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value;
                                    });
                                  }),
                              Text('Onsite or Remote'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Type of Talent',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.1),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding: const EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[500],
                            ),
                          ),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                top: 5,
                                left: 5,
                                bottom: 10,
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            hint: Text('Choose One'),
                            items: talent,
                            onChanged: (value) {
                              oportunidade.categoria = value;
                              // print(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Type of Role',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[500],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _cor = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: _cor == 1 ? Colors.orange : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              top: 8.0,
                              left: 8.0,
                            ),
                            child: Text('Full-time'),
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _cor = 2;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: _cor == 2 ? Colors.indigo : null,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              top: 8.0,
                              left: 8.0,
                            ),
                            child: Text('Part-time'),
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _cor = 3;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: _cor == 3 ? Colors.deepOrange : null,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              top: 8.0,
                              left: 8.0,
                            ),
                            child: Text('Freelance'),
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _cor = 4;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: _cor == 4 ? Colors.blue : null,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              top: 8.0,
                              left: 8.0,
                            ),
                            child: Text('Contract'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Text(
                    'Social Links',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Text(
                    'Website',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[500],
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    maxLengthEnforced: true,
                    maxLength: 30,
                    maxLines: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'https://www.website.com.br/',
                      contentPadding: const EdgeInsets.only(
                        top: 5,
                        left: 5,
                        bottom: 12,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onSaved: (value) {
                      oportunidade.website = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Photo to your Job',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2.0,
                          left: 5.0,
                        ),
                        child: Text(
                          'Got a great photo of the team, the office, or anything else related to the job listing?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: InkWell(
                    onTap: getImage,
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[500],
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text('Click here to upload'),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: Center(
                    child: _image == null
                        ? Text('No image selected.')
                        : Image.file(
                            _image,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 3.0,
                //   ),
                //   child: Text(
                //     'Max 5MB.',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Colors.grey[500],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Text(
                    'Youtube Video',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[500],
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    maxLengthEnforced: true,
                    maxLength: 30,
                    maxLines: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Video',
                      contentPadding: const EdgeInsets.only(
                        top: 5,
                        left: 5,
                        bottom: 12,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onSaved: (value) {
                      oportunidade.urlYoutube = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    children: [
                      RaisedButton(
                        onPressed: makeOportunidade,
                        // onPressed: () => Navigator.of(context)
                        //     .pushNamed(OportunidadePagamentoScreen.routeName),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Process',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.deepOrange,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.grey),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
