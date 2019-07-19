import 'dart:async';

import 'package:flutter_logger/flutter_logger.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/actions/socket_io_actions.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/data/push_id_generator.dart';
import 'package:multiple_identities/data/random_color.dart';
import 'package:multiple_identities/epics/register_user_socket_epic.dart';
import 'package:multiple_identities/epics/socket_io_epics.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/connection_status.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final Log log = new Log('Epics');

class AppEpics {
  AppEpics({@required this.repository});

  final AppRepository repository;

  Epic<AppState> build() => combineEpics<AppState>(<Epic<AppState>>[
        //new TypedEpic<AppState, SubscribeToMessages>((a, s) => subscribeToMessages(a, s, repository)),
        new TypedEpic<AppState, AddIdentity>(addIdentity),
        new TypedEpic<AppState, SendMessage>(sendMessage),
        new TypedEpic<AppState, RegisterUserSocket>(new RegisterUserSocketEpic(repository)),
        new SocketIoEpics(repository).build(),
      ]);

  Stream<dynamic> addIdentity(Stream<AddIdentity> actions, EpicStore<AppState> store) {
    return new Observable<AddIdentity>(actions)
        .map((AddIdentity action) => new AppUser((b) => (b
          ..uid = PushIdGenerator.generatePushChildName()
          ..color = RandomColor.color
          ..status = ConnectionStatus.connecting
          ..lastAction = new DateTime.now()
          ..name = action.name)))
        .flatMap((AppUser user) => new Observable<dynamic>.fromIterable(<dynamic>[
              new AddAppUser(user),
              new RegisterUserSocket(user),
            ]));
  }

  Stream<AddMessage> sendMessage(Stream<SendMessage> actions, EpicStore<AppState> store) => new Observable(actions)
          .map((SendMessage action) => new SocketMessage((b) {
                b
                  ..userName = store.state.currentUser.name
                  ..message = action.message
                  ..now = new DateTime.now()
                  ..type = MessageType.message;
              }))
          .asyncMap((SocketMessage message) async {
        await store.state.currentUser.socket.emit(RegisterUserSocketEpic.newMessage, <String>[message.message]);
        return message;
      }).map((SocketMessage message) => new AddMessage(message));
}
