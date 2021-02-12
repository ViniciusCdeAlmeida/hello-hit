import 'package:hellohit/providers/autenticacao_controller.dart';
import 'package:hellohit/providers/cadastro_controller.dart';
import 'package:hellohit/providers/comentario_post_controller.dart';
import 'package:hellohit/providers/feed_controller.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/message_controller.dart';
import 'package:hellohit/providers/oportunidade_controller.dart';
import 'package:hellohit/providers/pagamento_controller.dart';
import 'package:hellohit/providers/post_controller.dart';
import 'package:hellohit/providers/postagem_controller.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:hellohit/providers/search_controller.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/cadastro_store.dart';
import 'package:hellohit/providers/stores/comentario_post_store.dart';
import 'package:hellohit/providers/stores/edicao_profile_store.dart';
import 'package:hellohit/providers/stores/feed_store.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/providers/stores/oportunidade_store.dart';
import 'package:hellohit/providers/stores/pagamento_store.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/providers/stores/postagem_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/providers/stores/search_store.dart';
import 'package:hellohit/providers/stores/time_store.dart';
import 'package:hellohit/providers/time_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
        create: (ctx) => TimeController(),
      ),
      Provider(
        create: (ctx) => EdicaoProfileStore(),
      ),
      Provider(
        create: (ctx) => MarketplaceStore(
          OportunidadeController(),
        ),
      ),
      Provider(
        create: (ctx) => PostStore(
          PostController(),
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
