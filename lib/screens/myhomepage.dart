
import 'package:calculator/components/button_history.dart';
import 'package:calculator/components/operation_holder.dart';
import 'package:calculator/util.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final buttonTextStyle = {
    'operators': TextStyle(
        color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 24),
    'number': TextStyle(
        color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
    'equal': TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
    'cleardel':
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)
  };

  bool isHistoryDisplayed = false;
  String operation, result;

  List<Map<String, dynamic>> history = [];

  void buttonAct(String act) {
    if (isOperator(act)) {
      switch (act) {
        case '÷':
          operation = addOperation(operation, ' ÷ ');
          break;
        case '×':
          operation = addOperation(operation, ' × ');
          break;
        case '-':
          (operation.isEmpty)
              ? operation += '-'
              : operation = addOperation(operation, ' - ');
          break;
        case '+':
          operation = addOperation(operation, ' + ');
          break;
        default:
      }
    } else {
      operation += act;
    }
    if (operation.isNotEmpty) result = operate(operation);
    setState(() {});
  }

  @override
  void initState() {
    operation = '';
    result = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Positioned.fill(
                child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 212, 58, 1),
              ),
            )),
            Positioned.fill(
                child: OperationHolder(result, getDisplayOperation(operation))),
            Container(
                margin: EdgeInsets.only(top: 100),
                child: ListView.builder(
                    itemCount: (isHistoryDisplayed) ? history.length : 0,
                    itemBuilder: (context, i) => OperationHolder(
                        history[i]['result'],
                        getDisplayOperation(history[i]['operation'])))),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                bottom: (isHistoryDisplayed) ? -250 : 0,
                child: Material(
                    elevation: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('7'),
                                        child: Center(
                                            child: Text('7',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('4'),
                                        child: Center(
                                            child: Text('4',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('1'),
                                        child: Center(
                                            child: Text('1',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () {
                                          if (operation[operation.length - 1] !=
                                              ' ') {
                                            setState(() {
                                              operation = operation.substring(
                                                  0, operation.length - 1);
                                            });
                                            buttonAct('');
                                          }
                                        },
                                        child: Center(
                                            child: Text('Del',
                                                style: buttonTextStyle[
                                                    'cleardel'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('÷'),
                                        child: Center(
                                            child: Text('÷',
                                                style: buttonTextStyle[
                                                    'operators']))))
                              ]),
                              Column(children: [
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('8'),
                                        child: Center(
                                            child: Text('8',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('5'),
                                        child: Center(
                                            child: Text('5',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('2'),
                                        child: Center(
                                            child: Text('2',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('0'),
                                        child: Center(
                                            child: Text('0',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('×'),
                                        child: Center(
                                            child: Text('×',
                                                style: buttonTextStyle[
                                                    'operators']))))
                              ]),
                              Column(children: [
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('9'),
                                        child: Center(
                                            child: Text('9',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('6'),
                                        child: Center(
                                            child: Text('6',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('3'),
                                        child: Center(
                                            child: Text('3',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('00'),
                                        child: Center(
                                            child: Text('00',
                                                style: buttonTextStyle[
                                                    'number'])))),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () => buttonAct('-'),
                                        child: Center(
                                            child: Text('-',
                                                style: buttonTextStyle[
                                                    'operators']))))
                              ]),
                              Column(children: [
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isHistoryDisplayed =
                                                !isHistoryDisplayed;
                                          });
                                        },
                                        child: Bhistory())),
                                Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            result = '';
                                            operation = '';
                                          });
                                        },
                                        child: Center(
                                            child: Text('C',
                                                style: buttonTextStyle[
                                                    'cleardel'])))),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        width: 58,
                                        decoration: BoxDecoration(
                                            color: Colors.brown,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                history.add(createHistory(
                                                    operation, result));
                                                operation = result;
                                                result = null;
                                              });
                                            },
                                            child: Center(
                                                child: Text('=',
                                                    style: buttonTextStyle[
                                                        'equal']))))),
                                Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                        onPressed: () => buttonAct('+'),
                                        child: Center(
                                            child: Text('+',
                                                style: buttonTextStyle[
                                                    'operators']))))
                              ]),
                            ])))),
          ])),
    ));
  }
}
