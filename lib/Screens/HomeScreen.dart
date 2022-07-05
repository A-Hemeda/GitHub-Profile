// ignore_for_file: unnecessary_import, deprecated_member_use, override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int count = 0;

  void increament() {
    setState(() {
      count++;
    });
  }

  void decreament() {
    setState(() {
      count = 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(
                  color: Color(0xff005070),
                  fontSize: 90,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                  onPressed: () {
                    increament();
                  },
                  shape: CircleBorder(),
                  color: Color(0xff004060),
                  child: Padding(
                    padding: EdgeInsets.all(70),
                    child: Text(
                      ' تسبيح',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    decreament();
                    print('Allah');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(40),
                    primary: Color(0xff006080),
                    shape: CircleBorder(),
                  ),
                  child: Text('إعادة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      )))
            ],
          ),
        ));
  }
}
