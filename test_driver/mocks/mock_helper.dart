import 'dart:io';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';
import 'package:hellohit/service/stores/index_stores.dart';
import 'package:mockito/mockito.dart';

class MockHelper extends Mock implements CadastroController {
  static void login() {
    final auth = Autenticacao(email: 'teste@teste.com', password: '1234567a-');
    AutenticacaoController _autenticacaoController;
    MessageController _messageController;
    when(AutenticacaoStore(_autenticacaoController, _messageController).autenticacaoUsuario(auth)).thenAnswer((_) {
      return Future.value(true);
    });
    sleep(Duration(seconds: 10));
  }

  static void register() {
    final auth = Cadastro(
      email: 'teste@teste.com',
      password: '1234567a-',
      confirmPassword: '1234567a-',
      fullName: 'name',
      userType: 'TEAM',
      username: '@username',
    );
    CadastroController _cadastroController;
    when(_cadastroController.cadastroUsuario(auth)).thenAnswer((_) async => {});
    // // expect(await fetchPost(client), isA<Post>());
    // sleep(Duration(seconds: 10));
    // verify(_cadastroController.cadastroUsuario(auth));
  }
}
