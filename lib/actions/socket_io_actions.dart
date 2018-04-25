import 'package:multiple_identities/models/socket_message.dart';

class SocketUserLogin {
  SocketUserLogin(this.uid, this.args);

  final String uid;
  final List<dynamic> args;

  @override
  String toString() => 'SocketUserLogin{uid: $uid, args: $args}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocketUserLogin && runtimeType == other.runtimeType && uid == other.uid && args == other.args;

  @override
  int get hashCode => uid.hashCode ^ args.hashCode;
}

class SocketConnected {
  SocketConnected(this.uid);

  final String uid;

  @override
  String toString() => 'SocketConnected{uid: $uid}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketConnected && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}

class SocketDisconnected {
  SocketDisconnected(this.uid);

  final String uid;

  @override
  String toString() => 'SocketConnected{uid: $uid}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketDisconnected && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}

class SocketConnectionError {
  SocketConnectionError(this.uid);

  final String uid;

  @override
  String toString() => 'SocketConnected{uid: $uid}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketConnectionError && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}

class SocketConnectionTimeout {
  SocketConnectionTimeout(this.uid);

  final String uid;

  @override
  String toString() => 'SocketConnected{uid: $uid}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketConnectionTimeout && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}

class SocketNewMessage {
  SocketNewMessage(Map<String, dynamic> args)
      : userName = args['username'],
        message = args['message'];

  final String userName;
  final String message;

  @override
  String toString() => 'SocketNewMessage{userName: $userName}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocketNewMessage && runtimeType == other.runtimeType && userName == other.userName && message == other.message;

  @override
  int get hashCode => userName.hashCode ^ message.hashCode;
}

class SocketUserJoined {
  SocketUserJoined(Map<String, dynamic> args)
      : userName = args['username'],
        userCount = args['numUsers'];

  final String userName;
  final int userCount;

  @override
  String toString() => 'SocketUserJoined{userName: $userName, userCount: $userCount}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocketUserJoined && runtimeType == other.runtimeType && userName == other.userName && userCount == other.userCount;

  @override
  int get hashCode => userName.hashCode ^ userCount.hashCode;
}

class SocketUserLeft {
  SocketUserLeft(Map<String, dynamic> args)
      : userName = args['username'],
        userCount = args['numUsers'];

  final String userName;
  final int userCount;

  @override
  String toString() => 'SocketUserLeft{userName: $userName, userCount: $userCount}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocketUserLeft && runtimeType == other.runtimeType && userName == other.userName && userCount == other.userCount;

  @override
  int get hashCode => userName.hashCode ^ userCount.hashCode;
}

class SocketUserTyping {
  SocketUserTyping(Map<String, dynamic> args) : userName = args['username'];

  final String userName;

  @override
  String toString() => 'SocketUserTyping{userName: $userName}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketUserTyping && runtimeType == other.runtimeType && userName == other.userName;

  @override
  int get hashCode => userName.hashCode;
}

class SocketUserStopTyping {
  SocketUserStopTyping(Map<String, dynamic> args) : userName = args['username'];

  final String userName;

  @override
  String toString() => 'SocketUserStopTyping{userName: $userName}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SocketUserStopTyping && runtimeType == other.runtimeType && userName == other.userName;

  @override
  int get hashCode => userName.hashCode;
}

class AddMessage {
  AddMessage(this.message);

  final SocketMessage message;

  @override
  String toString() => 'AppMessage{message: $message}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AddMessage && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
