import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum AuthMode { Signup, Login, Nothing }

class AuthModeBloc {
  PublishSubject<AuthMode> _streamControllerAuthModes = PublishSubject();

  Stream<AuthMode> get authModelStream => _streamControllerAuthModes.stream;

  AuthMode defaultAuthMode = AuthMode.Nothing;

  void changeAuthMode(int index) {
    switch (index) {
      case 0:
        _streamControllerAuthModes.sink.add(AuthMode.Nothing);
        break;
      case 1:
        _streamControllerAuthModes.sink.add(AuthMode.Signup);
        break;
      case 2:
        _streamControllerAuthModes.sink.add(AuthMode.Login);
        break;
      default:
    }
  }

  dispose() {
    _streamControllerAuthModes.close();
  }
}
