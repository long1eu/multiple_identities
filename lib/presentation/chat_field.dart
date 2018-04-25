import 'dart:async';

import 'package:engine_io_client/engine_io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multiple_identities/actions/actions.dart';
import 'package:multiple_identities/models/app_state.dart';
import 'package:rxdart/rxdart.dart';

class ChatField extends StatefulWidget {
  const ChatField();

  @override
  ChatFieldState createState() {
    return new ChatFieldState();
  }
}

class ChatFieldState extends State<ChatField> {
  static final Log log = new Log('ChatFieldState');
  final TextEditingController _controller = new TextEditingController();
  final StreamController<String> _typeController = new StreamController<String>.broadcast();

  @override
  void initState() {
    super.initState();
    new Observable(_typeController.stream)
        .doOnData((String _) => StoreProvider.of<AppState>(context).dispatch(new SetIsTyping(true)))
        .debounce(const Duration(seconds: 1))
        .doOnData((String _) => StoreProvider.of<AppState>(context).dispatch(new SetIsTyping(false)))
        .listen(null);
  }

  @override
  void dispose() {
    _typeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(8.0),
      child: new Material(
        elevation: 4.0,
        borderRadius: new BorderRadius.circular(32.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Flexible(
              child: new Container(
                constraints: const BoxConstraints(minHeight: 56.0),
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(left: 20.0),
                child: new TextField(
                  controller: _controller,
                  onChanged: (String text) => _typeController.add(text),
                  decoration: const InputDecoration(border: InputBorder.none),
                  maxLines: null,
                ),
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(8.0).copyWith(right: 8.0),
              child: new Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: new InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      StoreProvider.of<AppState>(context).dispatch(new SendMessage(_controller.text));
                      _controller.clear();
                    }
                  },
                  child: new LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return new Container(
                        width: 32.0,
                        height: 32.0,
                        margin: const EdgeInsets.all(4.0),
                        child: new Container(
                          margin: const EdgeInsets.only(left: 4.0),
                          child: const Icon(
                            Icons.send,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
