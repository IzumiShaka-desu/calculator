import 'package:flutter/material.dart';

class Bhistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 80,
        child: Stack(children: [
          Positioned.fill(
              child: Material(
                  child: Container(
                      color: Color.fromRGBO(255, 212, 58, 1),
                      width: double.infinity,
                      height: double.infinity))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity, height: 40, color: Colors.white)),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 50,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                    color: Color.fromRGBO(255, 212, 58, 1),
                  ))),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  width: 15,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50)),
                      color: Colors.white))),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  width: 15,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50)),
                      color: Colors.white))),
          Align(
              alignment: Alignment.center,
              child: Icon(Icons.history, color: Colors.white))
        ]));
  }
}
