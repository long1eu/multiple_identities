library socket_message;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:multiple_identities/models/message_type.dart';

part 'socket_message.g.dart';

abstract class SocketMessage implements Built<SocketMessage, SocketMessageBuilder>, Comparable<SocketMessage> {
  factory SocketMessage([SocketMessageBuilder updates(SocketMessageBuilder b)]) = _$SocketMessage;

  SocketMessage._();

  String get userName;

  Object get message;

  DateTime get now;

  MessageType get type;

  @override
  int compareTo(SocketMessage other) => other.now.compareTo(now);

  static Serializer<SocketMessage> get serializer => _$socketMessageSerializer;
}
