import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:socket_io_client/socket_io_client.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class ChatController {
  Socket socketSameRoom;
  StreamController<Message> controller = StreamController<Message>.broadcast();
  Socket configSocket(Map query) {
    Socket socket = io(
        DotEnv.env['API_URL'],
        OptionBuilder()
            .setTransports(
              ['websocket'],
            )
            .setQuery(query)
            .disableAutoConnect()
            .build());
    socket.connect();
    return socket;
  }

  // ignore: missing_return
  Stream<Message> listenMessage({Socket socket}) {
    socket.on('receive_message', (data) {
      controller.add(Message.fromJson(data));
      return Message.fromJson(data);
    });
    return controller.stream;
  }

  // ignore: missing_return
  Future<List<Message>> retrieveMessage({String idReceiver, String idSender}) async {
    try {
      Response roomRes = await Endpoint.postChatRoom({
        "receiverId": idReceiver,
        "senderId": idSender,
      });
      Response messagesRes = await Endpoint.getMessagesByChat(roomRes.data);
      return messagesRes.data.map<Message>((content) => Message.fromJson(content)).toList() as List<Message>;
    } on Exception catch (e) {
      throw e;
    }
  }

  // ignore: missing_return
  Stream<Message> listenOurMessage({String idReceiver, String idSender, String idConversation}) {
    socketSameRoom = io(
        DotEnv.env['API_URL'],
        OptionBuilder()
            .setTransports(
              ['websocket'],
            )
            .setQuery({
              "receiver": idReceiver,
              "sender": idSender,
              "idConversation": idConversation,
            })
            .disableAutoConnect()
            .build());
    socketSameRoom.connect();
    socketSameRoom.on('receive_message', (data) {
      controller.add(Message.fromJson(data));
      return Message.fromJson(data);
    });
    return controller.stream;
  }

  void sendMessage({String idReceiver, String idSender, String message, Socket socket}) {
    socket.emit('new_message', {
      'author': idSender,
      'conversation': idReceiver,
      'text': message,
    });
  }

  void disconnectRoom({Socket socket}) {
    // controller.close();
    socket.disconnect();
    if (socketSameRoom != null) socketSameRoom.disconnect();
  }
}
