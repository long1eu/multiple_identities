// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_user;

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

Serializer<AppUser> _$appUserSerializer = new _$AppUserSerializer();

class _$AppUserSerializer implements StructuredSerializer<AppUser> {
  @override
  final Iterable<Type> types = const [AppUser, _$AppUser];
  @override
  final String wireName = 'AppUser';

  @override
  Iterable serialize(Serializers serializers, AppUser object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(ConnectionStatus)),
      'lastAction',
      serializers.serialize(object.lastAction,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  AppUser deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new AppUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(ConnectionStatus))
              as ConnectionStatus;
          break;
        case 'lastAction':
          result.lastAction = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$AppUser extends AppUser {
  @override
  final String uid;
  @override
  final String name;
  @override
  final int color;
  @override
  final ConnectionStatus status;
  @override
  final DateTime lastAction;
  WebClient __webClient;

  factory _$AppUser([void updates(AppUserBuilder b)]) =>
      (new AppUserBuilder()..update(updates)).build();

  _$AppUser._({this.uid, this.name, this.color, this.status, this.lastAction})
      : super._() {
    if (uid == null) throw new BuiltValueNullFieldError('AppUser', 'uid');
    if (name == null) throw new BuiltValueNullFieldError('AppUser', 'name');
    if (color == null) throw new BuiltValueNullFieldError('AppUser', 'color');
    if (status == null) throw new BuiltValueNullFieldError('AppUser', 'status');
    if (lastAction == null)
      throw new BuiltValueNullFieldError('AppUser', 'lastAction');
  }

  @override
  WebClient get webClient => __webClient ??= super.webClient;

  @override
  AppUser rebuild(void updates(AppUserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBuilder toBuilder() => new AppUserBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppUser) return false;
    return uid == other.uid &&
        name == other.name &&
        color == other.color &&
        status == other.status &&
        lastAction == other.lastAction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid.hashCode), name.hashCode), color.hashCode),
            status.hashCode),
        lastAction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUser')
          ..add('uid', uid)
          ..add('name', name)
          ..add('color', color)
          ..add('status', status)
          ..add('lastAction', lastAction))
        .toString();
  }
}

class AppUserBuilder implements Builder<AppUser, AppUserBuilder> {
  _$AppUser _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  ConnectionStatus _status;
  ConnectionStatus get status => _$this._status;
  set status(ConnectionStatus status) => _$this._status = status;

  DateTime _lastAction;
  DateTime get lastAction => _$this._lastAction;
  set lastAction(DateTime lastAction) => _$this._lastAction = lastAction;

  AppUserBuilder();

  AppUserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _color = _$v.color;
      _status = _$v.status;
      _lastAction = _$v.lastAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUser other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppUser;
  }

  @override
  void update(void updates(AppUserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUser build() {
    final _$result = _$v ??
        new _$AppUser._(
            uid: uid,
            name: name,
            color: color,
            status: status,
            lastAction: lastAction);
    replace(_$result);
    return _$result;
  }
}
