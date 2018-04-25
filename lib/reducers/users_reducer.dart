import 'package:built_collection/built_collection.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:redux/redux.dart';

Reducer<ListBuilder<AppUser>> usersReducer = combineReducers<ListBuilder<AppUser>>(<Reducer<ListBuilder<AppUser>>>[
  addAppUser,
  updateAppUser,
]);

Reducer<ListBuilder<AppUser>> addAppUser = new TypedReducer<ListBuilder<AppUser>, AddAppUser>(
  (ListBuilder<AppUser> users, AddAppUser action) {
    if (action.user != null) users.add(action.user);
    users.sort();

    return users;
  },
);

Reducer<ListBuilder<AppUser>> updateAppUser = new TypedReducer<ListBuilder<AppUser>, UpdateAppUser>(
  (ListBuilder<AppUser> users, UpdateAppUser action) {
    if (action.user != null) {
      users.removeWhere((user) => user.uid == action.user.uid);
      users.add(action.user);
      users.sort();
    }

    return users;
  },
);
