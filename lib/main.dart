import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

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
          resizeToAvoidBottomInset: false,
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
  double _loginheight = 0;
  double _signupheight = 0;
  double _windowwidth = 0;
  double _windowheight = 0;
  double _loginYofset = 0;
  double _signupYofset = 0;
  double _loginxofset = 0;
  double _loginwidth = 0;
  double _loginopacity = 1;
  double _headingTop = 100;
  bool _keyboardVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print(visible);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _windowheight = MediaQuery.of(context).size.height;
    _windowwidth = MediaQuery.of(context).size.width;
    _loginheight = _windowheight - 270;
    _signupheight = _windowheight - 270;

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
        // _loginheight = _keyboardVisible ? _windowheight : _windowheight - 270;

        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _headingTop = 90;
        _loginYofset = _keyboardVisible ? 40 : 270;
        _signupYofset = _windowheight;
        _loginxofset = 0;
        _loginwidth = _windowwidth;
        _loginopacity = 1;
        _loginheight = _keyboardVisible ? _windowheight : _windowheight - 270;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _headingTop = 80;
        _loginYofset = _keyboardVisible ? 30 : 240;
        _signupYofset = _keyboardVisible ? 55 : 270;
        _loginxofset = 20;
        _loginwidth = _windowwidth - 40;
        _loginopacity = 0.7;

        _signupheight = _keyboardVisible ? _windowheight : _windowheight - 270;

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
        AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginwidth,
            height: _loginheight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(_loginxofset, _loginYofset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginopacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login To Continue',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputwithIcon(),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      btnText: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pagestat = 2;
                        });
                      },
                      child: OutlineBtn(
                        btnText: 'Create New Account',
                      ),
                    )
                  ],
                ),
              ],
            )),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          height: _signupheight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _signupYofset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Create a New Account',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InputwithIcon(),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    btnText: 'Create Account',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pagestat = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: 'Back To Login',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // signup
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB40284A), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});
  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFB40284A), width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Color(0xFFB40284A), fontSize: 16),
        ),
      ),
    );
  }
}

class InputwithIcon extends StatefulWidget {
  @override
  _InputwithIconState createState() => _InputwithIconState();
}

class _InputwithIconState extends State<InputwithIcon> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      hintText: 'Enter Email'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      hintText: 'Password'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
