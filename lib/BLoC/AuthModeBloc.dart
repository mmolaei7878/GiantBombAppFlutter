import 'dart:async';

enum AuthMode { Signup, Login, Nothing }

class AuthModeBloc {
  StreamController<AuthMode> _streamControllerAuthMode = StreamController();

  Stream<AuthMode> get authModelStream => _streamControllerAuthMode.stream;

  AuthMode defaultAuthMode = AuthMode.Nothing;

  void changeAuthMode(int index) {
    switch (index) {
      case 0:
        _streamControllerAuthMode.sink.add(AuthMode.Nothing);
        break;
      case 1:
        _streamControllerAuthMode.sink.add(AuthMode.Signup);
        break;
      case 2:
        _streamControllerAuthMode.sink.add(AuthMode.Login);
        break;
      default:
    }
  }

  dispose() {
    _streamControllerAuthMode.close();
  }
}

final authMode = AuthModeBloc();
