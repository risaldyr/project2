import 'package:flutter/material.dart';
import 'package:tugas11/multi.dart';
import 'package:tugas11/single.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Home Page Risaldy Raflisyamsudin-2070801340",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Single();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Single Provider",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  )),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Multi();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Multi Provider",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
