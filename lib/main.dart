import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Container(child: SplashPage()),
        ));
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _pagestat = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);
  double _windowwidth = 0;
  double _windowheight = 0;
  double _loginYofset = 0;
  double _signupYofset = 0;
  double _loginxofset = 0;
  double _loginwidth = 0;
  double _loginopacity = 1;
  double _headingTop = 100;

  @override
  Widget build(BuildContext context) {
    _windowheight = MediaQuery.of(context).size.height;
    _windowwidth = MediaQuery.of(context).size.width;

    switch (_pagestat) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        _headingTop = 100;
        _loginYofset = _windowheight;
        _signupYofset = _windowheight;
        _loginxofset = 0;
        _loginwidth = _windowwidth;
        _loginopacity = 1;

        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _headingTop = 90;
        _loginYofset = 270;
        _signupYofset = _windowheight;
        _loginxofset = 0;
        _loginwidth = _windowwidth;
        _loginopacity = 1;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _headingTop = 80;
        _loginYofset = 240;
        _signupYofset = 270;
        _loginxofset = 20;
        _loginwidth = _windowwidth - 40;
        _loginopacity = 0.7;

        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pagestat = 0;
                  });
                },
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: _headingTop),
                      child: Text(
                        'Learn Free',
                        style: TextStyle(fontSize: 28, color: _headingColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'We make learning easy. Join SoftniqueBd to learn flutter for free on YouTube.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: _headingColor),
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Image.asset('assets/images/splash_bg.png'),
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    print(_pagestat);
                    if (_pagestat != 0) {
                      _pagestat = 0;
                    } else {
                      _pagestat = 1;
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xFFB40284A),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
        // login
        GestureDetector(
          onTap: () {
            setState(() {
              _pagestat = 2;
            });
          },
          child: AnimatedContainer(
            width: _loginwidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(_loginxofset, _loginYofset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginopacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pagestat = 1;
            });
          },
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _signupYofset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        // signup
      ],
    );
  }
}
