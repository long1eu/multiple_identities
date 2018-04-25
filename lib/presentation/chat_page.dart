import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:multiple_identities/containers/current_user_container.dart';
import 'package:multiple_identities/containers/messages_container.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:multiple_identities/presentation/chat_field.dart';
import 'package:multiple_identities/presentation/message_chat/socket_chat_item.dart';

class ChatPage extends StatelessWidget {
  const ChatPage();

  @override
  Widget build(BuildContext context) {
    return new CurrentUserContainer(
      builder: (BuildContext context, AppUser user) {
        return new MessagesContainer(
          builder: (BuildContext context, BuiltList<SocketMessage> messages) {
            return new CurrentUserContainer(
              builder: (BuildContext context, AppUser currentUser) {
                return new Theme(
                  data: Theme.of(context).copyWith(),
                  child: new Scaffold(
                    backgroundColor: new Color(user.color),
                    appBar: new AppBar(
                      title: new Text(user.name),
                    ),
                    body: new Column(
                      children: <Widget>[
                        new Flexible(
                          child: new ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int i) {
                              final SocketMessage current = messages[i];

                              bool siblingAbove = false;
                              bool siblingBelow = false;

                              if (i != 0)
                                siblingBelow =
                                    messages[i - 1].userName == currentUser.name && current.userName == currentUser.name;
                              if (i != messages.length - 1)
                                siblingAbove =
                                    messages[i + 1].userName == currentUser.name && current.userName == currentUser.name;

                              return new SocketChatItem(
                                isUser: current.userName == currentUser.name,
                                chat: current,
                                siblingAbove: siblingAbove,
                                siblingBelow: siblingBelow,
                              );
                            },
                          ),
                        ),
                        new Theme(
                          data: new ThemeData.light(),
                          child: const ChatField(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
