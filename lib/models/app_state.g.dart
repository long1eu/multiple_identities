// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

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

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AppUser)])),
      'socketMessages',
      serializers.serialize(object.socketMessages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SocketMessage)])),
      'isTyping',
      serializers.serialize(object.isTyping,
          specifiedType: const FullType(bool)),
    ];
    if (object.currentUser != null) {
      result
        ..add('currentUser')
        ..add(serializers.serialize(object.currentUser,
            specifiedType: const FullType(AppUser)));
    }

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(AppUser)])) as BuiltList);
          break;
        case 'currentUser':
          result.currentUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppUser)) as AppUser);
          break;
        case 'socketMessages':
          result.socketMessages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SocketMessage)]))
              as BuiltList);
          break;
        case 'isTyping':
          result.isTyping = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<AppUser> users;
  @override
  final AppUser currentUser;
  @override
  final BuiltList<SocketMessage> socketMessages;
  @override
  final bool isTyping;
  BuiltList<String> __userNames;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.users, this.currentUser, this.socketMessages, this.isTyping})
      : super._() {
    if (users == null) throw new BuiltValueNullFieldError('AppState', 'users');
    if (socketMessages == null)
      throw new BuiltValueNullFieldError('AppState', 'socketMessages');
    if (isTyping == null)
      throw new BuiltValueNullFieldError('AppState', 'isTyping');
  }

  @override
  BuiltList<String> get userNames => __userNames ??= super.userNames;

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppState) return false;
    return users == other.users &&
        currentUser == other.currentUser &&
        socketMessages == other.socketMessages &&
        isTyping == other.isTyping;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, users.hashCode), currentUser.hashCode),
            socketMessages.hashCode),
        isTyping.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('users', users)
          ..add('currentUser', currentUser)
          ..add('socketMessages', socketMessages)
          ..add('isTyping', isTyping))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<AppUser> _users;
  ListBuilder<AppUser> get users =>
      _$this._users ??= new ListBuilder<AppUser>();
  set users(ListBuilder<AppUser> users) => _$this._users = users;

  AppUserBuilder _currentUser;
  AppUserBuilder get currentUser =>
      _$this._currentUser ??= new AppUserBuilder();
  set currentUser(AppUserBuilder currentUser) =>
      _$this._currentUser = currentUser;

  ListBuilder<SocketMessage> _socketMessages;
  ListBuilder<SocketMessage> get socketMessages =>
      _$this._socketMessages ??= new ListBuilder<SocketMessage>();
  set socketMessages(ListBuilder<SocketMessage> socketMessages) =>
      _$this._socketMessages = socketMessages;

  bool _isTyping;
  bool get isTyping => _$this._isTyping;
  set isTyping(bool isTyping) => _$this._isTyping = isTyping;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _users = _$v.users?.toBuilder();
      _currentUser = _$v.currentUser?.toBuilder();
      _socketMessages = _$v.socketMessages?.toBuilder();
      _isTyping = _$v.isTyping;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              users: users.build(),
              currentUser: _currentUser?.build(),
              socketMessages: socketMessages.build(),
              isTyping: isTyping);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
        _$failedField = 'currentUser';
        _currentUser?.build();
        _$failedField = 'socketMessages';
        socketMessages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
