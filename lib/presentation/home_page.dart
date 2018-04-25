import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/containers/users_container.dart';
import 'package:multiple_identities/main.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/connection_status.dart';
import 'package:multiple_identities/presentation/nickname_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Identities'),
      ),
      body: new UsersContainer(
        builder: (BuildContext context, BuiltList<AppUser> users) {
          return new ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              final AppUser appUser = users[i];
              return new ListTile(
                onTap: appUser.status == ConnectionStatus.connected
                    ? () {
                        final AppUserBuilder builder = appUser.toBuilder();
                        builder.lastAction = new DateTime.now();

                        StoreProvider.of<AppState>(context).dispatch(new SetCurrentUser(builder.build()));
                        Navigator.pushNamed(context, AppRoutes.chatPage);
                      }
                    : () {},
                leading: new CircleAvatar(
                  backgroundColor: new Color(appUser.color),
                ),
                title: new Text(appUser.name),
                trailing: () {
                  switch (appUser.status) {
                    case ConnectionStatus.disconnected:
                      return new Icon(
                        Icons.leak_remove,
                        color: Colors.blueGrey,
                      );
                    case ConnectionStatus.connecting:
                      return new Icon(
                        Icons.leak_add,
                        color: Colors.orange,
                      );
                    case ConnectionStatus.error:
                      return new Icon(
                        Icons.bug_report,
                        color: Colors.red,
                      );
                    default:
                      return new Icon(
                        Icons.linear_scale,
                        color: Colors.green,
                      );
                  }
                }(),
              );
            },
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () async {
          final String name = await showDialog<String>(
            context: context,
            builder: (BuildContext context) => const NicknameDialog(),
          );

          if (name != null) {
            StoreProvider.of<AppState>(context).dispatch(new AddIdentity(name));
          }
        },
      ),
    );
  }
}
