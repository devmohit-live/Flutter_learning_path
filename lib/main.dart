import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x;
    var imgurl =
        "https://scontent.fshl1-1.fna.fbcdn.net/v/t1.0-9/88307149_2759901384127044_8953669088761085952_n.jpg?_nc_cat=108&_nc_sid=85a577&_nc_ohc=1P_NLEQQtKcAX-axSJI&_nc_ht=scontent.fshl1-1.fna&oh=bc555ee56a20e09915b9fc8fd22b27ab&oe=5F4EC29F";
    funccmd(var cmd) async {
      String url = "http://192.168.43.55/cgi-bin/$cmd";
      var response = await http.get(url);
      print("Status code is ${response.statusCode}");
      print("Output is");
      print(response.body);
      // print(x);
    }

    FlutterStatusbarcolor.setStatusBarColor(Colors.deepOrange);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () => print("hello"))
            ],
            title: Text("Remote Command Eexecutor"),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: 300,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.deepOrangeAccent,
              ),
              child: Column(
                children: <Widget>[
                  Image(
                    alignment: Alignment.center,
                    image: NetworkImage(imgurl),
                    fit: BoxFit.contain,
                    width: 130,
                    height: 80,
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        // icon: Icon(Icons.send),
                        hintText: 'Write Command Here',
                        // helperText: 'Helper Text',
                        // counterText: '0 characters',
                        border: const OutlineInputBorder(),
                      ),
                      cursorColor: Colors.green,
                      cursorWidth: 2,
                      onChanged: (value) {
                        x = value;
                        // print(x);
                      },
                    ),
                  ),
                  Card(
                    child: FlatButton(
                        onPressed: () {
                          // print(x);
                          funccmd(x);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Submit'),
                            Icon(Icons.subdirectory_arrow_left)
                          ],
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
