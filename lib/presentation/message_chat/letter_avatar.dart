import 'dart:io';

import 'package:engine_io_client/engine_io_client.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  static final Log log = new Log('UserAvatar');

  const UserAvatar({this.path, this.name = 'Some Name'});

  final String path;
  final String name;

  String _getInitials() {
    final List<String> parts = name.split(' ');
    if (parts.length == 1) {
      if (parts[0].length == 1) {
        return parts[0] * 2;
      } else {
        return parts[0].substring(0, 2);
      }
    } else {
      return parts[0].substring(0, 1) + parts[1].substring(0, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: const <Color>[
            Colors.black12,
            Colors.black54,
          ],
        ),
      ),
      height: 48.0,
      width: 48.0,
      child: path == null
          ? Container(
              padding: const EdgeInsets.all(12.0),
              child: new FittedBox(
                fit: BoxFit.cover,
                child: new Text(
                  _getInitials().toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : path.contains('http') ? new Image.network(path) : new Image.file(new File(path)),
    );
  }
}
