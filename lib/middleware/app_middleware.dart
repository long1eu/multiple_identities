import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/epics/register_user_socket_epic.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  AppMiddleware(this.repository);

  final AppRepository repository;

  List<Middleware<AppState>> build() => <Middleware<AppState>>[
        new TypedMiddleware<AppState, SetIsTyping>(setIsTyping),
      ];

  void setIsTyping(Store<AppState> store, SetIsTyping action, NextDispatcher next) async {
    if (store.state.isTyping != action.isTyping) {
      next(action);
      await store.state.currentUser
          .getSocket()
          .emit(action.isTyping ? RegisterUserSocketEpic.typing : RegisterUserSocketEpic.stopTyping);
    }
  }
}
