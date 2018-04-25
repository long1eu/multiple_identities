// GENERATED CODE - DO NOT MODIFY BY HAND

part of socket_message;

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

Serializer<SocketMessage> _$socketMessageSerializer =
    new _$SocketMessageSerializer();

class _$SocketMessageSerializer implements StructuredSerializer<SocketMessage> {
  @override
  final Iterable<Type> types = const [SocketMessage, _$SocketMessage];
  @override
  final String wireName = 'SocketMessage';

  @override
  Iterable serialize(Serializers serializers, SocketMessage object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(Object)),
      'now',
      serializers.serialize(object.now,
          specifiedType: const FullType(DateTime)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MessageType)),
    ];

    return result;
  }

  @override
  SocketMessage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new SocketMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'now':
          result.now = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(MessageType)) as MessageType;
          break;
      }
    }

    return result.build();
  }
}

class _$SocketMessage extends SocketMessage {
  @override
  final String userName;
  @override
  final Object message;
  @override
  final DateTime now;
  @override
  final MessageType type;

  factory _$SocketMessage([void updates(SocketMessageBuilder b)]) =>
      (new SocketMessageBuilder()..update(updates)).build();

  _$SocketMessage._({this.userName, this.message, this.now, this.type})
      : super._() {
    if (userName == null)
      throw new BuiltValueNullFieldError('SocketMessage', 'userName');
    if (message == null)
      throw new BuiltValueNullFieldError('SocketMessage', 'message');
    if (now == null) throw new BuiltValueNullFieldError('SocketMessage', 'now');
    if (type == null)
      throw new BuiltValueNullFieldError('SocketMessage', 'type');
  }

  @override
  SocketMessage rebuild(void updates(SocketMessageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SocketMessageBuilder toBuilder() => new SocketMessageBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SocketMessage) return false;
    return userName == other.userName &&
        message == other.message &&
        now == other.now &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userName.hashCode), message.hashCode), now.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocketMessage')
          ..add('userName', userName)
          ..add('message', message)
          ..add('now', now)
          ..add('type', type))
        .toString();
  }
}

class SocketMessageBuilder
    implements Builder<SocketMessage, SocketMessageBuilder> {
  _$SocketMessage _$v;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  Object _message;
  Object get message => _$this._message;
  set message(Object message) => _$this._message = message;

  DateTime _now;
  DateTime get now => _$this._now;
  set now(DateTime now) => _$this._now = now;

  MessageType _type;
  MessageType get type => _$this._type;
  set type(MessageType type) => _$this._type = type;

  SocketMessageBuilder();

  SocketMessageBuilder get _$this {
    if (_$v != null) {
      _userName = _$v.userName;
      _message = _$v.message;
      _now = _$v.now;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocketMessage other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$SocketMessage;
  }

  @override
  void update(void updates(SocketMessageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SocketMessage build() {
    final _$result = _$v ??
        new _$SocketMessage._(
            userName: userName, message: message, now: now, type: type);
    replace(_$result);
    return _$result;
  }
}
