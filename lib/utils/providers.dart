import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
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
    ];
