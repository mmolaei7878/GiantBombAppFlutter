import 'package:flutter/material.dart';
import '../BLoC/AuthModeBloc.dart';
import '../BLoC/Authenthication.dart';

class AuthScreen extends StatefulWidget {
  static const routeNamed = '/AuthScreen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  final GlobalKey<FormState> _signUpFormKey = GlobalKey();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void login() {
    _loginFormKey.currentState.save();
    authentication.login(
        email: _authData['email'], password: _authData["password"]);
  }

  void signUp() {
    _signUpFormKey.currentState.save();
    authentication.signUp(
        email: _authData['email'], password: _authData["password"]);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 3.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/asset/3.jpg',
              fit: BoxFit.cover,
              width: mqw,
              height: mqh,
            ),
          ),
          Positioned(
            bottom: 0,
            height: mqh / 2,
            width: mqw,
            child: Container(
              child: StreamBuilder(
                  initialData: authMode.defaultAuthMode,
                  stream: authMode.authModelStream,
                  builder: (ctx, AsyncSnapshot<AuthMode> snapShot) {
                    switch (snapShot.data) {
                      case AuthMode.Nothing:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SlideTransition(
                              position: _offsetAnimation,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: FlatButton(
                                  height: 48,
                                  minWidth: mqw - 100,
                                  color: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onPressed: () {
                                    authMode.changeAuthMode(1);
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 45),
                                child: FlatButton(
                                  onPressed: () {
                                    authMode.changeAuthMode(2);
                                  },
                                  child: Text(
                                    'Log in',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                        break;
                      case AuthMode.Signup:
                        return SingleChildScrollView(
                          child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 90, left: 70),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8764B8),
                                    border: Border.all(
                                      color: Color(0xff8764B8),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  child: TextFormField(
                                    onSaved: (value) {
                                      _authData['email'] = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter Your Email'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 25, right: 70),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8764B8),
                                    border: Border.all(
                                      color: Color(0xff8764B8),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                  ),
                                  child: TextFormField(
                                    onSaved: (value) {
                                      _authData['password'] = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 85),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter Your Password'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 25, left: 70),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8764B8),
                                    border: Border.all(
                                      color: Color(0xff8764B8),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Confirm Your Password'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: FlatButton(
                                    height: 48,
                                    minWidth: mqw - 100,
                                    color: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onPressed: () {
                                      signUp();
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  child: FlatButton(
                                    onPressed: () {
                                      authMode.changeAuthMode(2);
                                    },
                                    child: Text(
                                      'Log In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        break;
                      case AuthMode.Login:
                        return SingleChildScrollView(
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 100, left: 70),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8764B8),
                                    border: Border.all(
                                      color: Color(0xff8764B8),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  child: TextFormField(
                                    onSaved: (value) {
                                      _authData['email'] = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter Your Email'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30, right: 70),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8764B8),
                                    border: Border.all(
                                      color: Color(0xff8764B8),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                  ),
                                  child: TextFormField(
                                    onSaved: (value) {
                                      _authData['password'] = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 85),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter Your Password'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: FlatButton(
                                    height: 48,
                                    minWidth: mqw - 100,
                                    color: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onPressed: () {
                                      login();
                                    },
                                    child: Text(
                                      'Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 45),
                                  child: FlatButton(
                                    onPressed: () {
                                      authMode.changeAuthMode(1);
                                    },
                                    child: Text(
                                      'Sign up',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      default:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: FlatButton(
                                  height: 48,
                                  minWidth: mqw - 100,
                                  color: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 16),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 45),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Log in',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
