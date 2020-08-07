import 'package:flutter/material.dart';

class OperationHolder extends StatelessWidget {
  final String displayOperation, result;
  final txtStyle = {
    'result': TextStyle(
        color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 22),
    'operation': TextStyle(
        color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 26)
  };

  OperationHolder(this.result, this.displayOperation);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(right: 10),
        width: double.infinity,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        (displayOperation == null || displayOperation.isEmpty)
                            ? '0'
                            : displayOperation,
                        style: txtStyle['operation'])))
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        (result == null || result.isEmpty) ? '' : result,
                        style: txtStyle['result'])))
          ])
        ]));
  }
}
