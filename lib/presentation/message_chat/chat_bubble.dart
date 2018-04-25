import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:multiple_identities/containers/current_user_container.dart';
import 'package:multiple_identities/models/app_user.dart';
import 'package:multiple_identities/models/socket_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    @required this.chat,
    @required this.isUser,
    @required this.siblingAbove,
    @required this.siblingBelow,
  });

  final SocketMessage chat;
  final bool isUser;
  final bool siblingAbove;
  final bool siblingBelow;

  BorderRadius getBorderRadius() {
    const Radius radius = const Radius.circular(12.0);
    const Radius radiusSmall = const Radius.circular(2.0);

    final Radius topStart = isUser ? radius : (siblingAbove ? radiusSmall : radius);
    final Radius bottomStart = isUser ? radius : (siblingBelow ? radiusSmall : radius);
    final Radius topEnd = isUser ? (siblingAbove ? radiusSmall : radius) : radius;
    final Radius bottomEnd = isUser ? (siblingBelow ? radiusSmall : radius) : radius;

    return new BorderRadius.only(
      topLeft: topStart,
      bottomLeft: bottomStart,
      topRight: topEnd,
      bottomRight: bottomEnd,
    );
  }

  EdgeInsetsGeometry getMargins() => new EdgeInsetsDirectional.only(
        start: 16.0,
        end: 16.0,
        top: siblingAbove ? 2.0 : 16.0,
        bottom: siblingBelow ? 2.0 : 16.0,
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<Widget> rowChildren = <Widget>[
      new Flexible(
        child: new Text(
          chat.message,
          textAlign: isUser ? TextAlign.end : TextAlign.start,
          softWrap: true,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
      ),
    ];

    final DateFormat format = new DateFormat.Hm(Localizations.localeOf(context).toString());
    final Widget date = new Container(
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Text(
        format.format(chat.now),
        style: const TextStyle(
          color: Colors.black54,
          fontStyle: FontStyle.italic,
        ),
      ),
    );

    if (isUser)
      rowChildren.insert(0, date);
    else
      rowChildren.add(date);

    return new Flexible(
      child: new Container(
        margin: getMargins(),
        constraints: new BoxConstraints(
          maxWidth: size.width * 0.9,
          minWidth: size.width * .2,
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: getBorderRadius(),
        ),
        child: new Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              new CurrentUserContainer(
                builder: (BuildContext context, AppUser user) {
                  return new Container(
                    margin: const EdgeInsets.all(4.0),
                    child: new Text(
                      chat.userName,
                      textAlign: isUser ? TextAlign.end : TextAlign.start,
                      softWrap: true,
                      style: new TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: new Color(user.color),
                      ),
                    ),
                  );
                },
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rowChildren,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
