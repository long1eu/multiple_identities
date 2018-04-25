library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([AppStateBuilder updates(AppStateBuilder b)]) {
    return new _$AppState((AppStateBuilder builder) => builder..update(updates));
  }

  factory AppState.initialState() {
    return new AppState((AppStateBuilder builder) {
      return builder
        ..users = new ListBuilder<AppUser>()
        ..socketMessages = new ListBuilder<SocketMessage>()
        ..isTyping = false;
    });
  }

  AppState._();

  BuiltList<AppUser> get users;

  @nullable
  AppUser get currentUser;

  BuiltList<SocketMessage> get socketMessages;

  @memoized
  BuiltList<SocketMessage> get currentMessages => new BuiltList(socketMessages.where((SocketMessage messages) {
        if (messages.type == MessageType.message) {
          return true;
        } else {
          return messages.userName != currentUser?.name;
        }
      }));

  bool get isTyping;

  @memoized
  BuiltList<String> get userNames => users.map((user) => user.name);

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
