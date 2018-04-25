import 'dart:async';

import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/actions/socket_io_actions.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/connection_status.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart';

class RegisterUserSocketEpic implements EpicClass {
  RegisterUserSocketEpic(this.repository);

  final AppRepository repository;

  static const String addUser = 'add user';
  static const String login = 'login';
  static const String newMessage = 'new message';
  static const String userJoined = 'user joined';
  static const String userLeft = 'user left';
  static const String typing = 'typing';
  static const String stopTyping = 'stop typing';

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<dynamic> a) {
    return new Observable(actions).cast<RegisterUserSocket>().flatMap((RegisterUserSocket action) {
      final EpicStore<AppState> store = a;
      final StreamController<dynamic> actions = new StreamController.broadcast();

      action.user.getSocket()
        ..on(login, (List<dynamic> args) async => actions.add(new SocketUserLogin(action.user.uid, args)))
        ..on(SocketEvent.connect, (List<dynamic> args) async => actions.add(new SocketConnected(action.user.uid)))
        ..on(SocketEvent.disconnect, (List<dynamic> args) async => actions.add(new SocketDisconnected(action.user.uid)))
        ..on(SocketEvent.connectError, (List<dynamic> args) async => actions.add(new SocketConnectionError(action.user.uid)))
        ..on(SocketEvent.connectTimeout, (List<dynamic> args) async => actions.add(new SocketConnectionTimeout(action.user.uid)));

      final bool appIsConnected = store.state.users.any((AppUser user) => user.status == ConnectionStatus.connected);
      if (!appIsConnected) {
        action.user.getSocket()
          ..on(newMessage, (List<dynamic> args) async => actions.add(new SocketNewMessage(args[0])))
          ..on(userJoined, (List<dynamic> args) async => actions.add(new SocketUserJoined(args[0])))
          ..on(userLeft, (List<dynamic> args) async => actions.add(new SocketUserLeft(args[0])))
          ..on(typing, (List<dynamic> args) async => actions.add(new SocketUserTyping(args[0])))
          ..on(stopTyping, (List<dynamic> args) async => actions.add(new SocketUserStopTyping(args[0])));
      }

      return new Observable.fromFuture(action.user.getSocket().open())
          .doOnData((dynamic _) => action.user.getSocket().emit(addUser, <String>[action.user.name]))
          .flatMap((_) => new Observable(actions.stream));
    });
  }
}
