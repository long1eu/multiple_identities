// GENERATED CODE - DO NOT MODIFY BY HAND

part of message_type;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

const MessageType _$message = const MessageType._('message');
const MessageType _$typing = const MessageType._('typing');
const MessageType _$info = const MessageType._('info');

MessageType _$MessageTypeValueOf(String name) {
  switch (name) {
    case 'message':
      return _$message;
    case 'typing':
      return _$typing;
    case 'info':
      return _$info;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageType> _$MessageTypeValues =
    new BuiltSet<MessageType>(const <MessageType>[
  _$message,
  _$typing,
  _$info,
]);

Serializer<MessageType> _$messageTypeSerializer = new _$MessageTypeSerializer();

class _$MessageTypeSerializer implements PrimitiveSerializer<MessageType> {
  @override
  final Iterable<Type> types = const <Type>[MessageType];
  @override
  final String wireName = 'MessageType';

  @override
  Object serialize(Serializers serializers, MessageType object,
          {FullType specifiedType: FullType.unspecified}) =>
      object.name;

  @override
  MessageType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      MessageType.valueOf(serialized as String);
}
