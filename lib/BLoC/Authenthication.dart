import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class Authentecation {
  final fireBaseApiKey = 'AIzaSyAmPasN5Y_mDZsI4FhHidrTAFcO9xvpuZE';
  String _token;
  String _userId;
  String _expiresIn;

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
    _expiresIn = jsonDecode(response.body)['expiresIn'];
    _tokenController.sink.add(_token);
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

    _tokenController.sink.add(_token);
  }
}

final authentication = Authentecation();
