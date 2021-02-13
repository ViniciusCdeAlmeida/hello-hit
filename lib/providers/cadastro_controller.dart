import 'package:dio/dio.dart';
import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class CadastroController {
  Cadastro cadastro;

  Future<void> cadastroUsuario(Cadastro usuario) async {
    try {
      usuario.userType == 'Team'
          ? usuario.userType = 'TEAM'
          : usuario.userType = 'FREE';
      await Endpoint.postCadastroUsuario(usuario);
      // await Endpoint.postProfileUsuario(res.data);
    } on DioError catch (e) {
      if (e.response != null)
        throw e.response.data['message'];
      else
        throw 'Check your connection.';
    } catch (e) {
      throw e;
    }
  }
}
