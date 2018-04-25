import 'package:flutter/material.dart';
import 'package:flutter_logger/flutter_logger.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/models/message_type.dart';
import 'package:multiple_identities/models/socket_message.dart';
import 'package:multiple_identities/presentation/message_chat/info_chat_item.dart';
import 'package:multiple_identities/presentation/message_chat/message_chat_item.dart';

class SocketChatItem extends StatelessWidget {
  static final Log log = new Log('ChatItem');

  const SocketChatItem({
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
    return new GestureDetector(
      child: chat.type == MessageType.message
          ? new MessageChatItem(
              chat: chat,
              isUser: isUser,
              siblingAbove: siblingAbove,
              siblingBelow: siblingBelow,
            )
          : new InfoChatItem(chat: chat),
    );
  }
}
