import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:redux/redux.dart';

class UsersContainer extends StatelessWidget {
  const UsersContainer({Key key, @required this.builder}) : super(key: key);
  final ViewModelBuilder<BuiltList<AppUser>> builder;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, BuiltList<AppUser>>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.users,
    );
  }
}
