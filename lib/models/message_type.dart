library message_type;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_type.g.dart';

class MessageType extends EnumClass {
  const MessageType._(String name) : super(name);

  static const MessageType message = _$message;
  static const MessageType typing = _$typing;
  static const MessageType info = _$info;

  static BuiltSet<MessageType> get values => _$MessageTypeValues;

  static MessageType valueOf(String name) => _$MessageTypeValueOf(name);

  static Serializer<MessageType> get serializer => _$messageTypeSerializer;
}
