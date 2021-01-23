import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hellohit/models/feed_model.dart';

class FeedController {
  Feed feed;

  Future<Feed> seed() async {
    ByteData data = await rootBundle.load('assets/resources/feed_seed.json');
    var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
    print(json);
    return feed;
  }
}
