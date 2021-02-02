import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_web/flutter_google_places_web.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:google_place/google_place.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_pagamento_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class OportunidadeCriacaoScreen extends StatefulWidget {
  static const routeName = '/oportunidadeCriacaoScreen';
  @override
  _OportunidadeCriacaoScreenState createState() =>
      _OportunidadeCriacaoScreenState();
}

class _OportunidadeCriacaoScreenState extends State<OportunidadeCriacaoScreen> {
  QuillController _controller = QuillController.basic();
  int _radioValue = 0;
  int _cor = 0;
  String apiKey;

  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  List<DropdownMenuItem<int>> t = [
    DropdownMenuItem<int>(
      value: 1,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 2,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 3,
      child: Text('data'),
      onTap: () {},
    ),
    DropdownMenuItem(
      value: 4,
      child: Text('data'),
      onTap: () {},
    ),
  ];

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  @override
  void initState() {
    apiKey = DotEnv.env['API_KEY'];
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  File _image;
  final picker = ImagePicker();

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        // padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          initialValue: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Job title *',
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {},
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Team',
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
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
              FlutterGooglePlacesWeb(
                apiKey: apiKey,
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 0.1),
                                        child: Container(
                                          height: 30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText:
                                                  'e.g City, State, or Country',
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 5,
                                                left: 5,
                                                bottom: 10,
                                              ),
                                              enabledBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            controller: null,
                                            onEditingComplete: () {},
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                autoCompleteSearch(value);
                                              } else {
                                                if (predictions.length > 0 &&
                                                    mounted) {
                                                  setState(() {
                                                    predictions = [];
                                                  });
                                                }
                                              }
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
                          items: t,
                          onChanged: (value) {
                            print(value);
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
                child: TextField(
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
                  controller: null,
                  onEditingComplete: null,
                  onChanged: null,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                ),
                child: Text(
                  'The bigger the better (up to 10MB).',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  'Youtube or Vimeo Promo Video',
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
                child: TextField(
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
                  controller: null,
                  onEditingComplete: null,
                  onChanged: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(OportunidadePagamentoScreen.routeName),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'Preview',
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
    );
  }
}
