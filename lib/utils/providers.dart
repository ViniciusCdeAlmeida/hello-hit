import 'package:hellohit/providers/autenticacao_controller.dart';
import 'package:hellohit/providers/cadastro_controller.dart';
import 'package:hellohit/providers/feed_controller.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/post_controller.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:hellohit/providers/search_controller.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/cadastro_store.dart';
import 'package:hellohit/providers/stores/feed_store.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:hellohit/providers/stores/search_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() => [
      Provider(
        create: (ctx) => MarketPlaceController(),
      ),
      Provider(
        create: (ctx) => MarketplaceStore(
          MarketPlaceController(),
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
          PostStore(
            PostController(),
          ),
          MarketplaceStore(
            MarketPlaceController(),
          ),
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
        ),
      ),
    ];
