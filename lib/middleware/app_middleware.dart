import 'dart:async';

import 'package:engine_io_client/src/emitter/emitter.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/epics/register_user_socket_epic.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

class AppMiddleware {
  AppMiddleware(this.repository);

  final AppRepository repository;

  List<Middleware<AppState>> build() => <Middleware<AppState>>[
        new TypedMiddleware<AppState, SetIsTyping>(setIsTyping),
      ];

  void setIsTyping(Store<AppState> store, SetIsTyping action, NextDispatcher next) async {
    if (store.state.isTyping != action.isTyping) {
      next(action);

      final controller = new StreamController<int>();
      final int time = new DateTime.now().millisecondsSinceEpoch;

      store.state.currentUser.socket.on(RegisterUserSocketEpic.typing).listen((Event event) {
        print('\n\n${event.args}\n\n');
        if (event.args[0] == time) {
          controller.add(event.args[0]);
          controller.close();
        }
      });

      new Observable.just(action.isTyping)
          .map((bool isTyping) => isTyping ? RegisterUserSocketEpic.typing : RegisterUserSocketEpic.stopTyping)
          .flatMap((String message) => new Observable.periodic(
                const Duration(seconds: 3),
                (_) => store.state.currentUser.socket.emit(message, <int>[time]),
              ).takeUntil(new Observable(controller.stream)))
          .listen(print);
    }
  }
}
