library app_user;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:engine_io_client/engine_io_client.dart' show SocketOptions, SocketOptionsBuilder, WebSocket;
import 'package:multiple_identities/data/web_client.dart';
import 'package:multiple_identities/models/connection_status.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder>, Comparable<AppUser> {
  factory AppUser([AppUserBuilder updates(AppUserBuilder b)]) = _$AppUser;

  AppUser._();

  static final Map<String, Socket> sockets = <String, Socket>{};

  String get uid;

  String get name;

  int get color;

  ConnectionStatus get status;

  DateTime get lastAction;

  Socket getSocket() =>
      sockets[uid] ??
      () {
        final Socket socket = Io.socket('https://socket-io-chat.now.sh/', new ManagerOptions((ManagerOptionsBuilder b) {
          b.options = new SocketOptions((SocketOptionsBuilder b) {
            b
              ..path = '/socket.io'
              ..host = 'socket-io-chat.now.sh'
              ..transports = new ListBuilder<String>([WebSocket.NAME]);
          }).toBuilder();
        }));

        sockets[uid] = socket;

        return socket;
      }();

  @memoized
  WebClient get webClient => new WebClient(this);

  @override
  int compareTo(AppUser other) => other.lastAction.compareTo(lastAction);

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
