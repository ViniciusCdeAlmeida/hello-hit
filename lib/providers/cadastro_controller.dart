import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hellohit/models/cadastro_model.dart';

class CadastroController {
  Cadastro cadastro;

  // ignore: missing_return
  Future<Cadastro> cadastroUsuario(Cadastro usuario) async {
    try {
      Dio dio = Dio()..options.baseUrl = "http://192.168.15.7:3000/";

      await dio.post('signup', data: usuario);
    } catch (e) {
      throw e;
    }
  }
}
