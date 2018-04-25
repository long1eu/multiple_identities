// GENERATED CODE - DO NOT MODIFY BY HAND

part of connection_status;

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

const ConnectionStatus _$connecting = const ConnectionStatus._('connecting');
const ConnectionStatus _$connected = const ConnectionStatus._('connected');
const ConnectionStatus _$disconnected =
    const ConnectionStatus._('disconnected');
const ConnectionStatus _$error = const ConnectionStatus._('error');

ConnectionStatus _$ConnectionStatusValueOf(String name) {
  switch (name) {
    case 'connecting':
      return _$connecting;
    case 'connected':
      return _$connected;
    case 'disconnected':
      return _$disconnected;
    case 'error':
      return _$error;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ConnectionStatus> _$ConnectionStatusValues =
    new BuiltSet<ConnectionStatus>(const <ConnectionStatus>[
  _$connecting,
  _$connected,
  _$disconnected,
  _$error,
]);

Serializer<ConnectionStatus> _$connectionStatusSerializer =
    new _$ConnectionStatusSerializer();

class _$ConnectionStatusSerializer
    implements PrimitiveSerializer<ConnectionStatus> {
  @override
  final Iterable<Type> types = const <Type>[ConnectionStatus];
  @override
  final String wireName = 'ConnectionStatus';

  @override
  Object serialize(Serializers serializers, ConnectionStatus object,
          {FullType specifiedType: FullType.unspecified}) =>
      object.name;

  @override
  ConnectionStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      ConnectionStatus.valueOf(serialized as String);
}
