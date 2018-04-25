library connection_status;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connection_status.g.dart';

class ConnectionStatus extends EnumClass {
  const ConnectionStatus._(String name) : super(name);

  static const ConnectionStatus connecting = _$connecting;
  static const ConnectionStatus connected = _$connected;
  static const ConnectionStatus disconnected = _$disconnected;
  static const ConnectionStatus error = _$error;

  static BuiltSet<ConnectionStatus> get values => _$ConnectionStatusValues;

  static ConnectionStatus valueOf(String name) => _$ConnectionStatusValueOf(name);

  static Serializer<ConnectionStatus> get serializer => _$connectionStatusSerializer;
}
