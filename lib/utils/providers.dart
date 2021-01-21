import 'package:hellohit/providers/feed_controller.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/post_controller.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:hellohit/providers/stores/feed_store.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
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
        ),
      ),
      Provider(
        create: (ctx) => FeedStore(
          FeedController(),
        ),
      ),
    ];
