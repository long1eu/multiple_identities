import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:redux/redux.dart';

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({Key key, @required this.builder}) : super(key: key);
  final ViewModelBuilder<BuiltList<SocketMessage>> builder;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, BuiltList<SocketMessage>>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.currentMessages,
    );
  }
}
