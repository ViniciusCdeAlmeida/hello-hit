import 'package:hellohit/service/controllers/chat_controller.dart';
import 'package:hellohit/service/stores/chat_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:hellohit/service/controllers/index_controllers.dart';
import 'package:hellohit/service/stores/index_stores.dart';

List<SingleChildWidget> providers() => [
      Provider(
        create: (ctx) => MarketPlaceController(),
      ),
      Provider(
        create: (ctx) => PagamentoController(),
      ),
      Provider(
        create: (ctx) => CadastroController(),
      ),
      Provider(
        create: (ctx) => PagamentoController(),
      ),
      Provider(
        create: (ctx) => AutenticacaoController(),
      ),
      Provider(
        create: (ctx) => FeedController(),
      ),
      Provider(
        create: (ctx) => MarketPlaceController(),
      ),
      Provider(
        create: (ctx) => OportunidadeController(),
      ),
      Provider(
        create: (ctx) => PostagemController(),
      ),
      Provider(
        create: (ctx) => ChatController(),
      ),
      Provider(
        create: (ctx) => TimeController(),
      ),
      Provider(
        create: (ctx) => EdicaoProfileStore(),
      ),
      Provider(
        create: (ctx) => ChatStore(
          ChatController(),
        ),
      ),
      Provider(
        create: (ctx) => MarketplaceStore(
          OportunidadeController(),
        ),
      ),
      Provider(
        create: (ctx) => ProfileStore(
          ProfileController(),
        ),
      ),
      Provider(
        create: (ctx) => FeedStore(
          FeedController(),
        ),
      ),
      Provider(
        create: (ctx) => SearchStore(
          SearchController(),
        ),
      ),
      Provider(
        create: (ctx) => CadastroStore(
          CadastroController(),
        ),
      ),
      Provider(
        create: (ctx) => AutenticacaoStore(
          AutenticacaoController(),
          MessageController(),
        ),
      ),
      Provider(
        create: (ctx) => PostagemStore(
          PostagemController(),
        ),
      ),
      Provider(
        create: (ctx) => TimeStore(
          ProfileController(),
        ),
      ),
      Provider(
        create: (ctx) => OportunidadeStore(
          OportunidadeController(),
        ),
      ),
      Provider(
        create: (ctx) => PagamentoStore(
          PagamentoController(),
          AutenticacaoStore(
            AutenticacaoController(),
            MessageController(),
          ),
        ),
      ),
      Provider(
        create: (ctx) => ComentarioPostStore(
          ComentarioPostController(),
        ),
      ),
    ];
