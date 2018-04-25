import 'package:engine_io_client/engine_io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/data/app_repository.dart';
import 'package:multiple_identities/epics/epics.dart';
import 'package:multiple_identities/generated/i18n.dart';
import 'package:multiple_identities/middleware/app_middleware.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/presentation/chat_page.dart';
import 'package:multiple_identities/presentation/home_page.dart';
import 'package:multiple_identities/reducers/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  //Log.shouldLog = false;
  Store<AppState> store;
  final AppRepository repository = new AppRepository();
  store = new Store<AppState>(
    appReducer,
    distinct: true,
    initialState: new AppState.initialState(),
    middleware: <Middleware<AppState>>[]
      ..addAll(new AppMiddleware(repository).build())
      ..add(new EpicMiddleware<AppState>(new AppEpics(repository: repository).build())),
  );

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.grey,
          brightness: Brightness.dark,
          platform: TargetPlatform.iOS,
        ),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          AppRoutes.chatPage: (BuildContext context) => const ChatPage(),
        },
      ),
    );
  }
}

class AppRoutes {
  static const String chatPage = '/chatPage';
}
