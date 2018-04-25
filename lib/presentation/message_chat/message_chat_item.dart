import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:multiple_identities/presentation/message_chat/chat_bubble.dart';
import 'package:multiple_identities/presentation/message_chat/letter_avatar.dart';

class MessageChatItem extends StatelessWidget {
  const MessageChatItem({
    @required this.chat,
    @required this.isUser,
    @required this.siblingAbove,
    @required this.siblingBelow,
  });

  final SocketMessage chat;
  final bool isUser;
  final bool siblingAbove;
  final bool siblingBelow;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      new Opacity(
        opacity: siblingAbove ? 0.0 : 1.0,
        child: new Container(
          margin: new EdgeInsetsDirectional.only(
            start: isUser ? 0.0 : 16.0,
            end: isUser ? 16.0 : 0.0,
          ),
          child: new UserAvatar(name: chat.userName),
        ),
      ),
    ];

    final ChatBubble chatBubble = new ChatBubble(
      chat: chat,
      isUser:isUser,
      siblingAbove: siblingAbove,
      siblingBelow: siblingBelow,
    );

    if (isUser)
      children.insert(0, chatBubble);
    else
      children.add(chatBubble);

    return new Container(
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
