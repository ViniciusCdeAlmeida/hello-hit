import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class CadastroController {
  Cadastro cadastro;

  // ignore: missing_return
  Future<Cadastro> cadastroUsuario(Cadastro usuario) async {
    try {
      Response res = await Endpoint.postCadastroUsuario(usuario);
      // await Endpoint.postProfileUsuario(res.data);
    } catch (e) {
      throw e;
    }
  }
}
