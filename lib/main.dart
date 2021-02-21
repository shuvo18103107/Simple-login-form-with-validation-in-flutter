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

  @override
  Widget build(BuildContext context) {
    switch (_pagestat) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        break;
    }
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(milliseconds: 1000),
      color: _backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
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
    );
  }
}
