import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*
  http module doesn't takes variable as url the url has to be directly given in url field as it gives socket error 
  */
  var date = "http://192.168.43.55/cgi-bin/date";
  var id = "http://192.168.43.55/cgi-bin/id";
  String cal = "http://192.168.43.55/cgi-bin/cal";

  funcdate() async {
    var response = await http.get(date);
    print("Status code is ${response.statusCode}");
    print("Output is");
    print(response.body);
  }

  funccal() async {
    var response = await http.get(cal);
    print("Status code is ${response.statusCode}");
    print("Output is");
    print(response.body);
  }

  funcid() async {
    var response = await http.get(id);
    print("Status code is ${response.statusCode}");
    print("Output is");
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.amber);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // textDirection: TextDirection.ltr,
              children: <Widget>[
                Container(
                  child: RaisedButton(
                      child: Text("Execute Date command"), onPressed: funcdate),
                ),
                Container(
                  child: RaisedButton(
                      child: Text("Execute ID command"), onPressed: funcid),
                ),
                Container(
                  child: RaisedButton(
                      child: Text("Execute Cal command"), onPressed: funccal),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
