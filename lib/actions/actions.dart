import 'package:multiple_identities/models/app_user.dart';

class AddIdentity {
  AddIdentity(this.name);

  final String name;

  @override
  String toString() => 'AddIdentity{name: $name}';
}

class RegisterUserSocket {
  RegisterUserSocket(this.user);

  final AppUser user;

  @override
  String toString() => 'RegisterUserSocket{user: $user}';
}

class AddAppUser {
  AddAppUser(this.user);

  final AppUser user;

  @override
  String toString() => 'AddAppUser{user: $user}';
}

class UpdateAppUser {
  UpdateAppUser(this.user);

  final AppUser user;

  @override
  String toString() => 'UpdateAppUser{user: $user}';
}

class SetCurrentUser {
  SetCurrentUser(this.user);

  final AppUser user;

  @override
  String toString() => 'SetCurrentUser{user: $user}';
}

class SetIsTyping {
  SetIsTyping(this.isTyping);

  final bool isTyping;

  @override
  String toString() => 'SetIsTyping{isTyping: $isTyping}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SetIsTyping && runtimeType == other.runtimeType && isTyping == other.isTyping;

  @override
  int get hashCode => isTyping.hashCode;
}

class SendMessage {
  SendMessage(this.message);

  final String message;

  @override
  String toString() => 'SendMessage{message: $message}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SendMessage && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
