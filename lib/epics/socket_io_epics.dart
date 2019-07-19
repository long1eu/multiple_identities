import 'dart:async';

import 'package:engine_io_client/engine_io_client.dart';
import 'package:flutter_logger/flutter_logger.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/actions/socket_io_actions.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/connection_status.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final Log log = new Log('Epics');

class SocketIoEpics {
  SocketIoEpics(this.repository);

  final AppRepository repository;

  Epic<AppState> build() => combineEpics<AppState>(<Epic<AppState>>[
        new TypedEpic<AppState, SocketConnected>(connected),
        new TypedEpic<AppState, SocketDisconnected>(disconnected),
        new TypedEpic<AppState, SocketConnectionError>(connectionError),
        new TypedEpic<AppState, SocketConnectionTimeout>(connectionError),
        new TypedEpic<AppState, SocketNewMessage>(newMessage),
        new TypedEpic<AppState, SocketUserJoined>(userJoined),
        new TypedEpic<AppState, SocketUserLeft>(userLeft),
        new TypedEpic<AppState, SocketUserTyping>(userTyping),
        new TypedEpic<AppState, SocketUserStopTyping>(userStopTyping),
      ]);

  Stream<UpdateAppUser> connected(Stream<SocketConnected> actions, EpicStore<AppState> store) =>
      new Observable(actions).map((SocketConnected action) {
        final AppUser user = store.state.users.firstWhere((user) => user.uid == action.uid);
        final AppUserBuilder builder = user.toBuilder()..status = ConnectionStatus.connected;

        return new UpdateAppUser(builder.build());
      });

  Stream<UpdateAppUser> disconnected(Stream<SocketDisconnected> actions, EpicStore<AppState> store) =>
      new Observable(actions).map((SocketDisconnected action) {
        final AppUser user = store.state.users.firstWhere((user) => user.uid == action.uid);
        final AppUserBuilder builder = user.toBuilder()..status = ConnectionStatus.disconnected;

        return new UpdateAppUser(builder.build());
      });

  Stream<UpdateAppUser> connectionError(Stream<dynamic> actions, EpicStore<AppState> store) =>
      new Observable(actions).map((dynamic action) {
        final AppUser user = store.state.users.firstWhere((user) => user.uid == action.uid);
        final AppUserBuilder builder = user.toBuilder()..status = ConnectionStatus.error;

        return new UpdateAppUser(builder.build());
      });

  Stream<AddMessage> newMessage(Stream<SocketNewMessage> actions, EpicStore<AppState> store) => new Observable(actions)
      .where((SocketNewMessage action) => !store.state.userNames.contains(action.userName))
      .map((SocketNewMessage action) => new SocketMessage((b) {
            b
              ..userName = action.userName
              ..message = action.message
              ..now = new DateTime.now()
              ..type = MessageType.message;
          }))
      .map((SocketMessage message) => new AddMessage(message));

  Stream<AddMessage> userJoined(Stream<SocketUserJoined> actions, EpicStore<AppState> store) => new Observable(actions)
      .map((SocketUserJoined action) => new SocketMessage((b) {
            b
              ..userName = action.userName
              ..message = true
              ..now = new DateTime.now()
              ..type = MessageType.info;
          }))
      .map((SocketMessage message) => new AddMessage(message));

  Stream<AddMessage> userLeft(Stream<SocketUserLeft> actions, EpicStore<AppState> store) => new Observable(actions)
      .map((SocketUserLeft action) => new SocketMessage((b) {
            b
              ..userName = action.userName
              ..message = false
              ..now = new DateTime.now()
              ..type = MessageType.info;
          }))
      .map((SocketMessage message) => new AddMessage(message));

  Stream<AddMessage> userTyping(Stream<SocketUserTyping> actions, EpicStore<AppState> store) => new Observable(actions)
      .map((SocketUserTyping action) => new SocketMessage((b) {
            b
              ..userName = action.userName
              ..message = true
              ..now = new DateTime.now()
              ..type = MessageType.typing;
          }))
      .map((SocketMessage message) => new AddMessage(message));

  Stream<AddMessage> userStopTyping(Stream<SocketUserStopTyping> actions, EpicStore<AppState> store) => new Observable(actions)
      .map((SocketUserStopTyping action) => new SocketMessage((b) {
            b
              ..userName = action.userName
              ..message = false
              ..now = new DateTime.now()
              ..type = MessageType.typing;
          }))
      .map((SocketMessage message) => new AddMessage(message));
}
