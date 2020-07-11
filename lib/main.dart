import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  String str1 = '';
  String operation = '';
  String str2 = '';
  String show = '0';
  double i1;
  double i2;

  bPressed(String bText) {
    setState(() {
      if (bText == 'C') {
        str1 = '';
        operation = '';
        str2 = '';
        show = '0';
      } else if (bText == '÷') {
        operation = '/';
        show = str1;
      } else if (bText == '-') {
        operation = '-';
        show = str1;
      } else if (bText == '+') {
        operation = '+';
        show = str1;
      } else if (bText == '×') {
        operation = '*';
        show = str1;
      } else if (bText == '±') {
        show = str1;
      } else if (bText == '⌫') {
        if (str2 == '') {
          str1 = str1.substring(0, str1.length - 1);
          show = str1;
        } else {
          str2 = str2.substring(0, str2.length - 1);
          show = str2;
        }
      } else if (bText == '=') {
        i1 = double.parse(str1);
        i2 = double.parse(str2);
        if (operation == '+') {
          str1 = (i2 + i1).toString();
        }
        if (operation == '-') {
          str1 = (i1 - i2).toString();
        }
        if (operation == '*') {
          str1 = (i2 * i1).toString();
        }
        if (operation == '/') {
          if (i2 == 0) {
            str1 = '';
            str2 = '';
          } else {
            str1 = (i1 / i2).toString();
          }
        }
        if (str1 == '') {
          show = 'error';
        } else {
          show = str1;
        }
        str2 = '';
      } else {
        if (operation != '') {
          str2 = str2 + bText;
          show = str2;
        } else {
          str1 = str1 + bText;
          show = str1;
        }
      }
    });
  }

  Widget bButton(String bText, double bHeight, Color bColor) {
    return Padding(
        padding: const EdgeInsets.all(6.5),
        child: Container(
          decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          height: bHeight,
          width: 70,
          child: FlatButton(
            padding: const EdgeInsets.all(12.0),
            onPressed: () => bPressed(bText),
            child: Text(
              bText,
              style: TextStyle(color: color1, fontSize: 30),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: color2,
      body: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.35,
              alignment: Alignment(1, 0),
              padding: EdgeInsets.only(right: 20),
              child: Text(
                show,
                style: TextStyle(
                    color: color1, fontSize: 70, fontWeight: FontWeight.w300),
              )),
          Container(
              color: color3,
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        bButton('C', 70, color4),
                        bButton('±', 70, color4),
                        bButton('%', 70, color4),
                        bButton('÷', 70, color4),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        bButton('7', 70, color5),
                        bButton('8', 70, color5),
                        bButton('9', 70, color5),
                        bButton('×', 70, color4),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        bButton('4', 70, color5),
                        bButton('5', 70, color5),
                        bButton('6', 70, color5),
                        bButton('-', 70, color4),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        bButton('1', 70, color5),
                        bButton('2', 70, color5),
                        bButton('3', 70, color5),
                        bButton('+', 70, color4),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        bButton('0', 70, color5),
                        bButton('.', 70, color5),
                        bButton('=', 70, color5),
                        bButton('⌫', 70, color4)
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

var color1 = Colors.white;
var color2 = Color.fromRGBO(26, 27, 32, 1);
var color3 = Color.fromRGBO(15, 13, 18, 1);
var color4 = Color.fromRGBO(238, 45, 59, 1);
var color5 = Color.fromRGBO(51, 51, 63, 1);
