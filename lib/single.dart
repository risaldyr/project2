import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas11/aplication_color.dart';

class Single extends StatefulWidget {
  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ApplicationColor>(
              builder: (context, aplicationColor, _) => Text(
                    "Single Provider",
                    style: TextStyle(color: aplicationColor.color),
                  )),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, aplicationColor, _) => AnimatedContainer(
                    width: 300,
                    height: 300,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: aplicationColor.color,
                        border: Border.all(
                            color: Colors.lightBlueAccent, width: 5.0)),
                    child: Center(
                      child: Text(
                          "Selamat Datang Di Aplikasi Ini \n Terima Kasih",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Light",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, aplicationColor, _) => Switch(
                          value: aplicationColor.isLightBlack,
                          onChanged: (newValue) {
                            aplicationColor.isLightBlack = newValue;
                          }),
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
