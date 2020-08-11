import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var webdata;
  @override
  Widget build(BuildContext context) {
    var x;
    funccmd(var cmd) async {
      String url = "http://192.168.43.77/cgi-bin/exec?x=$cmd";
      var response = await http.get(url);
      setState(() {
        webdata = response.body;
      });
      print(webdata);
      if (response.statusCode == 200) {
        print(response.body);
        Fluttertoast.showToast(
            msg: "Command Runned Successfuly",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.amber,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        Fluttertoast.showToast(
            msg: "'Request failed with status: ${response.statusCode}.'",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.amber,
            textColor: Colors.black,
            fontSize: 20.0);
        print(response.statusCode);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () => {
                        Fluttertoast.showToast(
                            msg: "Developed by Mohit Singh ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.amber,
                            textColor: Colors.black,
                            fontSize: 16.0)
                      })
            ],
            title: Text("Remote Command Executor"),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.deepOrangeAccent,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image(
                      alignment: Alignment.center,
                      image: Image.asset('assets/images/me.jpg').image,
                      fit: BoxFit.contain,
                      width: 130,
                      height: 120,
                    ),
                    Card(
                      elevation: 8,
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Write Command Here',
                          border: const OutlineInputBorder(),
                        ),
                        cursorColor: Colors.green,
                        cursorWidth: 2,
                        onChanged: (value) {
                          x = value;
                        },
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: FlatButton(
                          onPressed: () {
                            funccmd(x);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Execute '),
                              Icon(Icons.subdirectory_arrow_left),
                            ],
                          )),
                    ),
                    Card(
                        color: Colors.amber.shade500,
                        elevation: 6,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(webdata ?? "Output will be shown here: "),
                        ))
                    // ?? is used to check whether it is null if it is return the default value provided after ??
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
