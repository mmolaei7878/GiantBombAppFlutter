import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum ModeTheme { Dark, Light }

class ThemeBloc {
  /* Map<String, dynamic> themeMode = {
    'colorsLightMode': [
      Color(0xff8764B8),
      Color(0xff000000),
    ],
    'colorsDarkMode': [
      Color(0xff8764B8),
      Color(0xff000000),
    ],
  }; */

  BehaviorSubject<ModeTheme> _colorSubject = BehaviorSubject<ModeTheme>();

  Stream<ModeTheme> get colorStream => _colorSubject.stream;

  ModeTheme defaultValue = ModeTheme.Light;

  void setColor(int index) {
    switch (index) {
      case 0:
        _colorSubject.sink.add(ModeTheme.Light);
        break;
      case 1:
        _colorSubject.sink.add(ModeTheme.Dark);
        break;
      default:
        _colorSubject.sink.add(ModeTheme.Light);
    }
  }

  dispose() {
    _colorSubject.close();
  }
}

final themeBloc = ThemeBloc();
