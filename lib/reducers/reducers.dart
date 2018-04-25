import 'package:built_collection/built_collection.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/actions/socket_io_actions.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:redux/redux.dart';

import 'users_reducer.dart';

Reducer<AppState> appReducer = combineReducers(<Reducer<AppState>>[
  rebuildReducer,
  setCurrentUser,
]);

AppState rebuildReducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder()
    ..update((AppStateBuilder b) {
      b
        ..users = usersReducer(state.users.toBuilder(), action)
        ..socketMessages = addMessage(state.socketMessages.toBuilder(), action)
        ..isTyping = setIsTyping(state.isTyping, action);
    });

  return builder.build();
}

Reducer<ListBuilder<SocketMessage>> addMessage = new TypedReducer<ListBuilder<SocketMessage>, AddMessage>(
  (ListBuilder<SocketMessage> messages, AddMessage action) {
    if (action.message.message is String) {
      messages
        ..insert(0, action.message)
        ..removeWhere(
            (SocketMessage message) => message.userName == action.message.userName && message.type == MessageType.typing);
    }

    if (action.message.message is bool && action.message.message) {
      messages.insert(0, action.message);
    } else {
      messages
        ..removeWhere(
            (SocketMessage message) => message.userName == action.message.userName && message.type == MessageType.typing);
    }

    messages.sort();

    return messages;
  },
);

Reducer<bool> setIsTyping = new TypedReducer<bool, SetIsTyping>((bool isTyping, SetIsTyping action) => action.isTyping);

Reducer<AppState> setCurrentUser = new TypedReducer<AppState, SetCurrentUser>((AppState state, SetCurrentUser action) {
  final AppStateBuilder builder = state.toBuilder();
  builder.currentUser = action.user.toBuilder();
  builder.users.removeWhere((user) => user.uid == action.user.uid);
  builder.users.add(action.user);
  builder.users.sort();

  return builder.build();
});
