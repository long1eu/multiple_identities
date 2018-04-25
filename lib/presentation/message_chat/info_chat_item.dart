import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';

class InfoChatItem extends StatelessWidget {
  const InfoChatItem({@required this.chat});

  final SocketMessage chat;

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
            color: Colors.black26,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          alignment: AlignmentDirectional.center,
          child: chat.type == MessageType.typing
              ? new Text(chat.message ? '${chat.userName} is typing' : '')
              : new Text(chat.message ? '${chat.userName} joined' : '${chat.userName} left'),
        ),
      ],
    );
  }
}
