import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:redux/redux.dart';

class CurrentUserContainer extends StatelessWidget {
  const CurrentUserContainer({Key key, @required this.builder}) : super(key: key);
  final ViewModelBuilder<AppUser> builder;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppUser>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.currentUser,
    );
  }
}
