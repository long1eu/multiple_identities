import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:multiple_identities/containers/users_container.dart';
import 'package:multiple_identities/models/app_user.dart';

class NicknameDialog extends StatefulWidget {
  const NicknameDialog();

  @override
  NicknameDialogState createState() {
    return new NicknameDialogState();
  }
}

class NicknameDialogState extends State<NicknameDialog> {
  final TextEditingController controller = new TextEditingController();
  bool _error = false;
  bool _nameExists = false;

  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return new UsersContainer(
      builder: (BuildContext context, BuiltList<AppUser> users) {
        return new AlertDialog(
          title: new Text('Pick a new nickname'),
          content: new TextField(
            controller: controller,
            autofocus: true,
            maxLines: 1,
            maxLength: 20,
            onChanged: (String text) {
              if (text.isNotEmpty && _error) {
                setState(() => _error = false);
              }

              print(users.any((user) => user.name == controller.text));
              if (!users.any((user) => user.name == controller.text) && _nameExists) {
                setState(() => _nameExists = false);
              }

              if (_autovalidate) {
                if (users.any((user) => user.name == controller.text)) {
                  setState(() => _nameExists = true);
                }

                if (text.isEmpty) {
                  setState(() => _error = true);
                }
              }
            },
            onSubmitted: (String text) {
              Navigator.pop(context, text);
            },
            decoration: new InputDecoration(
              labelText: 'nickname',
              errorText: _error ? 'This should not be empty' : _nameExists ? 'Choose a different name' : null,
              suffixIcon: _error
                  ? new Icon(
                      Icons.bubble_chart,
                      color: Colors.red,
                    )
                  : null,
            ),
          ),
          actions: <Widget>[
            new SimpleDialogOption(
              child: new Text('OK'),
              onPressed: () {
                if (users.any((user) => user.name == controller.text)) {
                  setState(() {
                    _autovalidate = true;
                    _nameExists = true;
                  });
                } else if (controller.text.isNotEmpty) {
                  Navigator.pop(context, controller.text);
                } else {
                  setState(() {
                    _autovalidate = true;
                    _error = true;
                  });
                }
              },
            ),
            new SimpleDialogOption(
              child: new Text('CANCEL'),
              onPressed: () => Navigator.pop(context, null),
            )
          ],
        );
      },
    );
  }
}
