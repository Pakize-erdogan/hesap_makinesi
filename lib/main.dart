import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

Widget calcbutton(
  String btntxt,
  Color btncolor,
  Color txtcolor,
  Function() onPressed,
) {
  return Container(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: btncolor,
        fixedSize: Size(70, 70),
      ),
      child: Text(
        '$btntxt',
        style: TextStyle(
          fontSize: 25,
          color: txtcolor,
        ),
      ),
    ),
  );
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 13, 48),
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color.fromARGB(255, 5, 13, 48),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.grey, Colors.black, () {
                  setState(() {
                    calculation('AC');
                  });
                }),
                calcbutton('+/-', Colors.grey, Colors.black, () {
                  setState(() {
                    calculation('+/-');
                  });
                }),
                calcbutton('%', Colors.grey, Colors.black, () {
                  setState(() {
                    calculation('%');
                  });
                }),
                calcbutton('/', Color.fromARGB(255, 39, 95, 124), Colors.white,
                    () {
                  setState(() {
                    calculation('/');
                  });
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('7');
                  });
                }),
                calcbutton('8', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('8');
                  });
                }),
                calcbutton('9', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('9');
                  });
                }),
                calcbutton('x', Color.fromARGB(255, 39, 95, 124), Colors.white,
                    () {
                  setState(() {
                    calculation('x');
                  });
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('4');
                  });
                }),
                calcbutton('5', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('5');
                  });
                }),
                calcbutton('6', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('6');
                  });
                }),
                calcbutton('-', Color.fromARGB(255, 39, 95, 124), Colors.white,
                    () {
                  setState(() {
                    calculation('-');
                  });
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('1');
                  });
                }),
                calcbutton('2', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('2');
                  });
                }),
                calcbutton('3', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('3');
                  });
                }),
                calcbutton('+', Color.fromARGB(255, 39, 95, 124), Colors.white,
                    () {
                  setState(() {
                    calculation('+');
                  });
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculation('0');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    primary: Colors.grey,
                  ),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calcbutton('.', Colors.grey, Colors.white, () {
                  setState(() {
                    calculation('.');
                  });
                }),
                calcbutton('=', Color.fromARGB(255, 39, 95, 124), Colors.white,
                    () {
                  setState(() {
                    calculation('=');
                  });
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void calculation(String btnText) {
    print('Button Pressed: $btnText');
    print(
        'numOne: $numOne, numTwo: $numTwo, opr: $opr, preOpr: $preOpr, result: $result, finalResult: $finalResult');
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
      print('Result after adding $btnText: $finalResult');
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
