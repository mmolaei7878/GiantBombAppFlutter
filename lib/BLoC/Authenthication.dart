import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentecation {
  final fireBaseApiKey = 'AIzaSyAmPasN5Y_mDZsI4FhHidrTAFcO9xvpuZE';
  String _token;
  String _userId;

  String get userId => _userId;

  BehaviorSubject<String> _tokenController = BehaviorSubject.seeded('null');
  Stream<String> get tokenStream => _tokenController.stream;

  dispose() {
    _tokenController.close();
  }

  Future<void> signUp(
      {@required String email, @required String password}) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$fireBaseApiKey';
    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    print(json.decode(response.body));

    _token = jsonDecode(response.body)['idToken'];
    _userId = jsonDecode(response.body)['localId'];

    _tokenController.sink.add(_token);

    final prefs = await SharedPreferences.getInstance();

    final userData = json.encode(
      {
        'token': _token,
        'userId': _userId,
      },
    );

    prefs.setString('userData', userData);
  }

  logOut() async {
    _token = null;
    _userId = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return _tokenController.value = null;
  }

  Future<void> login(
      {@required String email, @required String password}) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$fireBaseApiKey';
    final response = await http.post(
      url,
      body: json.encode(
        {'email': email, 'password': password, 'returnSecureToken': true},
      ),
    );
    print(json.decode(response.body));
    _token = jsonDecode(response.body)['idToken'];
    _userId = jsonDecode(response.body)['localId'];

    _tokenController.sink.add(_token);

    final prefs = await SharedPreferences.getInstance();

    final userData = json.encode(
      {
        'token': _token,
        'userId': _userId,
      },
    );

    prefs.setString('userData', userData);
  }

  tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    } else {
      final extractedUserData =
          json.decode(prefs.getString('userData')) as Map<String, Object>;

      _token = extractedUserData['token'];
      _userId = extractedUserData['userId'];

      _tokenController.sink.add(_token);
    }
  }
}
